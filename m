Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D940D7CE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:50:11 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoy0-0000RG-PM
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQouN-00062H-S9; Thu, 16 Sep 2021 06:46:24 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQouM-0002lR-1V; Thu, 16 Sep 2021 06:46:23 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MiMIY-1n55HF3eP0-00fSh1; Thu, 16 Sep 2021 12:25:36 +0200
Subject: Re: [PATCH v2] qobject: Fix maybe uninitialized in qdict_array_split
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210615130921.55008-1-frankja@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <39062092-83c3-251b-c583-35ec7a2a9a00@vivier.eu>
Date: Thu, 16 Sep 2021 12:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615130921.55008-1-frankja@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9of9/63qCdibC4smp6BCfEe6m55apDCOcyI0kT8wj1xDxt59zqx
 uOVckJVh8LIZWnEfO4u48KgO92fnPiKOsyqKt5pknNPvbPfuxg87FhjFe2EPb72IqoxDOf4
 h7GA55tHyrsdXdPncOaa2b3WIKDjcb7uTPoBDy9x95w6E1s64Jd5SXC1EYKnjZfuEVgZY9M
 mSWxDRN1ShRJCqsUjNQZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dUqRKBLwYt0=:baZJAWDBnJKxdl2FINAm0z
 zEne9UpLcXM8uuD1sZCeuHHBcMg86/YVabX1yqwtIUpZoEHWHvPegbIbMKqmvW6LU3jyvZ2K4
 yy+7e5kBi4anh47loougRad5DZRj9HmL/mq3dO9voN3SsyQgbBt97U3C/YOqcA1Oa1M41M3/b
 b53TRA0ZPVLokDlQnLebGTZCKdDcY/jz2C5USQvAkkVru6fbz+uUmFFEkiS7w9BidZCWRjp+F
 tdshbP4UNKzrGXvjDHB0yKcPqyvygvzdBc2+PM8aRySOznLUknsTExbwYaSd5Hvp4+X40vru7
 i4zZ3o0+VVP3U6347qhpPG2Li3yiwZ2/WYWJ02mbwlonZxbXyVQieyWd/Sm82ITFGPkDRWWIo
 DIVKq/UfACramLcvgcnj1B0RoIr7/e3abYMIp3/gasv3lTeiM6E+joCUW4tejBMiI2HKW6C3M
 pp1POP042alobN1wgTtnRtMfALkV9IBRk0GCz+kaVHpqO4rlVmAjC9/0spGEUcvsI/NuRsPX5
 QzAVWtGrmjx6tIloTSYiCtg9SvmCotrfcC2j/C7MQ4bhV4N8WrsOsqFpSZsyoXyIYqZcwaGVd
 ytBQErhpPlcZR92j2lKMqp9+LTRPBD9ZxXTlg56k3g+S3hnd9T+BvSeyHwH0VnUZYmN2Xkzix
 j7cGWw3RqEsn6gGU0TXOYcvaoBma/Q7I/punQFxh3gd/j74CzSMBJMAqNT58LBuoyYe5yZDy6
 +FFHmiItP7l+yZV1S7G7dQjSjnm8oymDQZRUFYMvdrHmANavNV51h876ZFrjPoh3VzgXXqdrQ
 SIVhN26
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, cohuck@redhat.com,
 philmd@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/06/2021 à 15:09, Janosch Frank a écrit :
> Lets make the compiler happy.
> Found on gcc version 10.3.0 (Ubuntu 10.3.0-1ubuntu1)
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qobject/block-qdict.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8..8d0f00bc3c 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -224,7 +224,6 @@ void qdict_array_split(QDict *src, QList **dst)
>      for (i = 0; i < UINT_MAX; i++) {
>          QObject *subqobj;
>          bool is_subqdict;
> -        QDict *subqdict;
>          char indexstr[32], prefix[32];
>          size_t snprintf_ret;
>  
> @@ -249,14 +248,16 @@ void qdict_array_split(QDict *src, QList **dst)
>          }
>  
>          if (is_subqdict) {
> +            QDict *subqdict = NULL;
> +

I think the "= NULL" is not needed with the v2 as the setter (qdict_extract_subqdict()) and
the user (qlist_append_obj()) are in the same block now.

>              qdict_extract_subqdict(src, &subqdict, prefix);
>              assert(qdict_size(subqdict) > 0);
> +            qlist_append_obj(*dst, QOBJECT(subqdict));
>          } else {
>              qobject_ref(subqobj);
>              qdict_del(src, indexstr);
> +            qlist_append_obj(*dst, subqobj);
>          }
> -
> -        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
>      }
>  }
>  
> 

Thanks,
Laurent

