Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822773B6BF5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 03:13:52 +0200 (CEST)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly2Jz-0006Ws-0f
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 21:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ly2J5-0005Wm-Pa
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 21:12:55 -0400
Received: from relay68.bu.edu ([128.197.228.73]:37349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ly2J1-0008JN-6r
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 21:12:54 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 15T1Bpxd011538
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 28 Jun 2021 21:11:54 -0400
Date: Mon, 28 Jun 2021 21:11:51 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] fuzz: make object-name matching case-insensitive
Message-ID: <20210629011151.7vz2a7d7j7a653pk@mozz.bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
 <20210628052349.113262-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628052349.113262-4-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210628 0123, Alexander Bulekov wrote:
> We have some configs for devices such as the AC97 and ES1370 that were
> not matching memory-regions correctly, because the configs provided
> lowercase names. To resolve these problems and prevent them from
> occurring again in the future, convert both the pattern and names to
> lower-case, prior to checking for a match.
> 
> Suggested-by: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 71d36e8f6f..0695a349b2 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -751,8 +751,13 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
>  
>  static int locate_fuzz_objects(Object *child, void *opaque)
>  {
> +    GString *type_name;
> +    GString *path_name;
>      char *pattern = opaque;
> -    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
> +
> +    type_name = g_string_new(object_get_typename(child));
> +    g_string_ascii_down(type_name);
> +    if (g_pattern_match_simple(pattern, type_name->str)) {
>          /* Find and save ptrs to any child MemoryRegions */
>          object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
>  
> @@ -769,8 +774,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>              g_ptr_array_add(fuzzable_pci_devices, PCI_DEVICE(child));
>          }
>      } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
> -        if (g_pattern_match_simple(pattern,
> -            object_get_canonical_path_component(child))) {
> +        path_name = g_string_new(object_get_canonical_path_component(child));
> +        g_string_ascii_down(path_name);
> +        if (g_pattern_match_simple(pattern, path_name->str)) {
>              MemoryRegion *mr;
>              mr = MEMORY_REGION(child);
>              if ((memory_region_is_ram(mr) ||
> @@ -779,7 +785,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>                  g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
>              }
>          }
> +        g_string_free(path_name, true);
>      }
> +    g_string_free(type_name, true);
>      return 0;
>  }
>  
> @@ -807,6 +815,7 @@ static void generic_pre_fuzz(QTestState *s)
>      MemoryRegion *mr;
>      QPCIBus *pcibus;
>      char **result;
> +    GString *pattern;
                  ^
Just noticed that this collides with struct pattern through a
sizeof(pattern) call below, causing nasty heap issues during fuzzing.
I'll send a v4 with a better name.

-Alex

>  
>      if (!getenv("QEMU_FUZZ_OBJECTS")) {
>          usage();
> @@ -836,10 +845,17 @@ static void generic_pre_fuzz(QTestState *s)
>  
>      result = g_strsplit(getenv("QEMU_FUZZ_OBJECTS"), " ", -1);
>      for (int i = 0; result[i] != NULL; i++) {
> +        pattern = g_string_new(result[i]);
> +        /*
> +         * Make the pattern lowercase. We do the same for all the MemoryRegion
> +         * and Type names so the configs are case-insensitive.
> +         */
> +        g_string_ascii_down(pattern);
>          printf("Matching objects by name %s\n", result[i]);
>          object_child_foreach_recursive(qdev_get_machine(),
>                                      locate_fuzz_objects,
> -                                    result[i]);
> +                                    pattern->str);
> +        g_string_free(pattern, true);
>      }
>      g_strfreev(result);
>      printf("This process will try to fuzz the following MemoryRegions:\n");
> -- 
> 2.28.0
> 

