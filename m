Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D22660D0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 15:59:09 +0200 (CEST)
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGja0-00022D-U5
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 09:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kGjYq-00011j-T8
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 09:57:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:51260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kGjYp-0006tC-1F
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 09:57:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1D8BAA35;
 Fri, 11 Sep 2020 13:58:06 +0000 (UTC)
Subject: Re: [PATCH] tests: add missing genh dependency
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200911134221.46636-3-pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5d641c1b-ab24-05fb-6f1d-fbd3e55bdf3b@suse.de>
Date: Fri, 11 Sep 2020 15:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200911134221.46636-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 22:28:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/20 3:42 PM, Paolo Bonzini wrote:
> Fix high-parallelism builds by forcing all generated headers
> to be created before tests are compiled.
> 
> Reported-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 3683512dca..e2b915ea8f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -56,7 +56,7 @@ test_qapi_files = custom_target('Test QAPI files',
>  # perhaps change qapi_gen to replace / with _, like Meson itself does?
>  subdir('include')
>  
> -libtestqapi = static_library('testqapi', sources: [test_qapi_files, test_qapi_outputs_extra])
> +libtestqapi = static_library('testqapi', sources: [test_qapi_files, genh, test_qapi_outputs_extra])
>  testqapi = declare_dependency(link_with: libtestqapi)
>  
>  testblock = declare_dependency(dependencies: [block], sources: 'iothread.c')
> @@ -223,7 +223,7 @@ foreach test_name, extra: tests
>      src += test_ss.all_sources()
>      deps += test_ss.all_dependencies()
>    endif
> -  exe = executable(test_name, src, dependencies: deps)
> +  exe = executable(test_name, src, genh, dependencies: deps)
>  
>    test(test_name, exe,
>         depends: test_deps.get(test_name, []),
> 

Tested with 160 processors,

make -j120

Tested-by: Claudio Fontana <cfontana@suse.de>

