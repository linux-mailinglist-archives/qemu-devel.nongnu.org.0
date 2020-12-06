Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285522D06DD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 20:26:01 +0100 (CET)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzfT-0003IC-OV
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 14:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1klzdY-0002fT-QY; Sun, 06 Dec 2020 14:24:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:54578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1klzdX-0002YX-9A; Sun, 06 Dec 2020 14:24:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63E26AC90;
 Sun,  6 Dec 2020 19:23:55 +0000 (UTC)
Subject: Re: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-3-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
Date: Sun, 6 Dec 2020 20:23:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 7:55 PM, Philippe Mathieu-Daudé wrote:
> Introduce a job template to cross-build accelerator specific
> jobs (enable a specific accelerator, disabling the others).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 099949aaef3..be63b209c5b 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -13,6 +13,18 @@
>            xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build
>  
> +.cross_accel_build_job:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  timeout: 30m
> +  script:
> +    - mkdir build
> +    - cd build
> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
> +    - make -j$(expr $(nproc) + 1) all check-build
> +
>  .cross_user_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> 

Hi Philippe,

probably I just don't understand how this works, but
where is the "disabling the others" part?

I see the --enable-${ACCEL:-kvm}, but I would expect some --disable-XXX ?

I am probably just missing something..

Thanks,

Ciao,

Claudio

