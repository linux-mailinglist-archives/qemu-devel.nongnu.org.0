Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF5442DAD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:17:56 +0100 (CET)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsjj-000260-3z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs6I-0004Ai-Mw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs6E-0006lE-Jk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg0pMQHu/Bm8vrv7VoacfnaUBlOHYg2tawfmdswsGY0=;
 b=Jxjfe3nHaVMIGLnxG7v4WL+/VwUTi/hlqBgbvITALjL7H/wADfXJIdKqr94XaEAVMFX3tW
 x9unmlIZA0R3mBBtTY73S2XM0G5LCYtP0bMsdLhM1ZszG/Z8Ij/2mpxvsG1BAW3rpYgPUy
 OOSWNbjYU61dBOXIlNjntY8OVQ3qFYk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-GmseDPOzOnSA6cO9n1IWSg-1; Tue, 02 Nov 2021 07:37:01 -0400
X-MC-Unique: GmseDPOzOnSA6cO9n1IWSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so754087wmj.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zg0pMQHu/Bm8vrv7VoacfnaUBlOHYg2tawfmdswsGY0=;
 b=PNm8uD+C/uPLqoDrkqko1dtgviNSf7m/027kCHrWNQcdLVyvkRP/qbmdrG9YB3glwN
 5jD6a3pCg+uPLL04HlTvQco6jd+PprFUupvlcjr3kViOC9YGFlnliUc/uINgNTKQimLa
 cqbMsBb2Bm7KQAFhWJYY8BGBQlCSJqAM7k4aeGaY/PEfw0QTbDcE2mN0XA+j8vXQpdtp
 ozZ5sTAK+rT4gdsrp+LcA+jJnP2H1rFDI/IC6nvIW5b+Gd4yaef4lcLar8SKfHoLVK3Z
 0Jx94zfevpgLwGLMJvdGpx8hwQuFNmJg56OtUAuAbrAoJr80Rh9s/dBFDHV3N1mTwToS
 a++Q==
X-Gm-Message-State: AOAM532PuxlJLEhuukRrsacr7gADWajixO8f+b3LpWzs/KT4a5QNrE+T
 bgYlCufY+hPweLVyGQQ8xNivHGAaVPXurXZzO1vE/FTmWGs6QfSJYNu70SKaYSaOr4sKpUwHLM4
 1so1JyBmiqIWVX7U=
X-Received: by 2002:adf:ded0:: with SMTP id i16mr41569358wrn.335.1635853019994; 
 Tue, 02 Nov 2021 04:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAHA8RUVYh3P1O9Po7neJKqLlmXgKfwqd5vchSb7u3SLJRSnqaOfdoT3ti6KMuWg6I5jdEcw==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr41569322wrn.335.1635853019726; 
 Tue, 02 Nov 2021 04:36:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g3sm20595821wri.45.2021.11.02.04.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:36:59 -0700 (PDT)
Message-ID: <d0ca6025-4e09-520a-e5d8-e1ff232f7fe7@redhat.com>
Date: Tue, 2 Nov 2021 12:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/4] Move the l2tpv3 test from configure to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-3-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211028185910.1729744-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 28/10/21 20:59, Thomas Huth wrote:
> And while we're at it, also provide a proper entry for this feature
> in meson_options.txt, so that people who don't need it have a knob
> to disable this feature.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure                     | 17 -----------------
>   meson.build                   |  8 ++++++++
>   meson_options.txt             |  2 ++
>   net/meson.build               |  4 +++-
>   scripts/meson-buildoptions.sh |  3 +++
>   5 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/configure b/configure
> index 8fe03b6230..170b1b237a 100755
> --- a/configure
> +++ b/configure
> @@ -1907,20 +1907,6 @@ if test -z "$want_tools"; then
>       fi
>   fi
>   
> -##########################################
> -# L2TPV3 probe
> -
> -cat > $TMPC <<EOF
> -#include <sys/socket.h>
> -#include <linux/ip.h>
> -int main(void) { return sizeof(struct mmsghdr); }
> -EOF
> -if compile_prog "" "" ; then
> -  l2tpv3=yes
> -else
> -  l2tpv3=no
> -fi
> -
>   #########################################
>   # vhost interdependencies and host support
>   
> @@ -3544,9 +3530,6 @@ if test "$slirp_smbd" = "yes" ; then
>     echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>     echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
>   fi
> -if test "$l2tpv3" = "yes" ; then
> -  echo "CONFIG_L2TPV3=y" >> $config_host_mak
> -fi
>   if test "$gprof" = "yes" ; then
>     echo "CONFIG_GPROF=y" >> $config_host_mak
>   fi
> diff --git a/meson.build b/meson.build
> index 2c5b53cbe2..5bb6b901b0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1678,6 +1678,13 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
>       return mlockall(MCL_FUTURE);
>     }'''))
>   
> +have_l2tpv3 = false
> +if not get_option('l2tpv3').disabled() and have_system
> +  have_l2tpv3 = (cc.has_header_symbol('sys/socket.h', 'struct mmsghdr')
> +                 and cc.has_header('linux/ip.h'))
> +endif
> +config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
> +
>   have_netmap = false
>   if not get_option('netmap').disabled() and have_system
>     have_netmap = cc.compiles('''
> @@ -3394,6 +3401,7 @@ summary_info += {'JACK support':      jack}
>   summary_info += {'brlapi support':    brlapi}
>   summary_info += {'vde support':       vde}
>   summary_info += {'netmap support':    have_netmap}
> +summary_info += {'l2tpv3 support':    have_l2tpv3}
>   summary_info += {'Linux AIO support': libaio}
>   summary_info += {'Linux io_uring support': linux_io_uring}
>   summary_info += {'ATTR/XATTR support': libattr}
> diff --git a/meson_options.txt b/meson_options.txt
> index 4ab4570125..e740dce2a5 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -141,6 +141,8 @@ option('u2f', type : 'feature', value : 'auto',
>          description: 'U2F emulation support')
>   option('usb_redir', type : 'feature', value : 'auto',
>          description: 'libusbredir support')
> +option('l2tpv3', type : 'feature', value : 'auto',
> +       description: 'l2tpv3 network backend support')
>   option('netmap', type : 'feature', value : 'auto',
>          description: 'netmap network backend support')
>   option('vde', type : 'feature', value : 'auto',
> diff --git a/net/meson.build b/net/meson.build
> index 94383e7460..847bc2ac85 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -18,7 +18,9 @@ softmmu_ss.add(files(
>   
>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>   
> -softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
> +if have_l2tpv3
> +  softmmu_ss.add(files('l2tpv3.c'))
> +endif
>   softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
>   softmmu_ss.add(when: vde, if_true: files('vde.c'))
>   if have_netmap
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index c795a13020..55b8a78560 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -49,6 +49,7 @@ meson_options_help() {
>     printf "%s\n" '  iconv           Font glyph conversion support'
>     printf "%s\n" '  jack            JACK sound support'
>     printf "%s\n" '  kvm             KVM acceleration support'
> +  printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
>     printf "%s\n" '  libdaxctl       libdaxctl support'
>     printf "%s\n" '  libiscsi        libiscsi userspace initiator'
>     printf "%s\n" '  libnfs          libnfs block device driver'
> @@ -166,6 +167,8 @@ _meson_option_parse() {
>       --disable-jack) printf "%s" -Djack=disabled ;;
>       --enable-kvm) printf "%s" -Dkvm=enabled ;;
>       --disable-kvm) printf "%s" -Dkvm=disabled ;;
> +    --enable-l2tpv3) printf "%s" -Dl2tpv3=enabled ;;
> +    --disable-l2tpv3) printf "%s" -Dl2tpv3=disabled ;;
>       --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
>       --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
>       --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
> 

Queued, thanks.

Paolo


