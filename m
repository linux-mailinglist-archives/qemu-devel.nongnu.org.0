Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F64487640
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:08:19 +0100 (CET)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n6Y-0003np-AW
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5n0p-0005Se-34
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5n0l-0001Pv-4F
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hzZIMKXBrSY/yOHqG8C4s6AFmJh02Jea393ldp9Ebs=;
 b=NByziR9Hin2ib21jRdcD/aG9gYCHkTd4sfqzbEnZfpWRuq+DPeplqqtx8NbZ+ipbAp9YNn
 RNLX+vX4cB/P5GDHa9svifCvlBfLFD8BqfyVdj5VZyCmOoRpUI8GKdzaYaYb6vds+iGRFV
 rxoAliLbxYT4CwLsW3rmGSM5wQ5178E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-_ZwrNuTLNZWU4c_ztcSLSg-1; Fri, 07 Jan 2022 06:02:16 -0500
X-MC-Unique: _ZwrNuTLNZWU4c_ztcSLSg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso2109685wrg.22
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=+hzZIMKXBrSY/yOHqG8C4s6AFmJh02Jea393ldp9Ebs=;
 b=fDQ3VZyerRstfToGFNQZjLb916ysZdgEOcb2eXfvI+heTTlMMrMmHgPETDktiGoLef
 qhoY4UnrkJOuMXR3VrEfZOr1am7GzxQTv720hxUYE7UAAEDom9kSK6AI4VONOX0uPwlK
 UpUZp7pniNX776BeFrMD4hsw6KtAWtRa20DRG+nP6YZLl/4bjRhgbT5f5t8FJwMIToLF
 /hl/nFgfQyEE6z0Yduwf+uQJeNakE7PiQD9+KHtNqExfca48Q31pj+LjVecKnh8rakkl
 pLzu09bhoKK6xla/dUzPg+crPoRF8hFJ2lZai03tNcY8xI9LuSiPCvAVZTt4dvpAaJZO
 YmGA==
X-Gm-Message-State: AOAM530yjHEH9jrIT+LaWbXndWXUZ8YpakMi4O/pLjB+ntaRB+8jGFwf
 rS6TKs+RNNwm+QTfAFI2H4e0vEyF8SRBzYeuSU7wtIIu6E/WFLZ3ilMLDKQbrB3RWDNulrvsYYr
 seF+2kNJTi2U0DrE=
X-Received: by 2002:a5d:4704:: with SMTP id y4mr54511327wrq.213.1641553335679; 
 Fri, 07 Jan 2022 03:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyYLqcGpZRmZEtfx4ZrEDT3XGxZr7/Rv3ozMbh/eN0HO4ySlH08dEIAupnnt/lqzN/73VAmQ==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr54511304wrq.213.1641553335391; 
 Fri, 07 Jan 2022 03:02:15 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id j39sm4374363wms.0.2022.01.07.03.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:02:14 -0800 (PST)
Message-ID: <23955e38-21fd-e490-29df-31629135286f@redhat.com>
Date: Fri, 7 Jan 2022 12:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211219141711.248066-1-pbonzini@redhat.com>
 <20211219141711.248066-10-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 09/16] configure: remove DIRS
In-Reply-To: <20211219141711.248066-10-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/12/2021 15.17, Paolo Bonzini wrote:
> DIRS is used to create the directory in which the LINKS symbolic links
> reside, or to create directories for object files.  The former can
> be done directly in the symlinking loop, while the latter is done
> by Meson already, so DIRS is not necessary.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index ba85bbb54b..8ccfe51673 100755
> --- a/configure
> +++ b/configure
> @@ -3762,7 +3762,6 @@ if test "$safe_stack" = "yes"; then
>   fi
>   
>   # If we're using a separate build tree, set it up now.
> -# DIRS are directories which we simply mkdir in the build tree;
>   # LINKS are things to symlink back into the source tree
>   # (these can be both files and directories).
>   # Caution: do not add files or directories here using wildcards. This
> @@ -3774,12 +3773,6 @@ fi
>   # UNLINK is used to remove symlinks from older development versions
>   # that might get into the way when doing "git update" without doing
>   # a "make distclean" in between.
> -DIRS="tests tests/tcg tests/qapi-schema tests/qtest/libqos"
> -DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
> -DIRS="$DIRS docs docs/interop fsdev scsi"
> -DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
> -DIRS="$DIRS roms/seabios"
> -DIRS="$DIRS contrib/plugins/"
>   LINKS="Makefile"
>   LINKS="$LINKS tests/tcg/Makefile.target"
>   LINKS="$LINKS pc-bios/optionrom/Makefile"
> @@ -3807,9 +3800,9 @@ for bios_file in \
>   do
>       LINKS="$LINKS pc-bios/$(basename $bios_file)"
>   done
> -mkdir -p $DIRS
>   for f in $LINKS ; do
>       if [ -e "$source_path/$f" ]; then
> +        mkdir -p `dirname ./$f`
>           symlink "$source_path/$f" "$f"
>       fi
>   done

  Hi Paolo,

I think this patch created some warnings with fresh build directories on git 
checkouts where roms/seabios is not initialized:

.../qemu/configure: line 3778: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3779: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3780: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3781: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3782: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3783: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3784: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3785: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3786: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3787: roms/seabios/config.mak: No such file or 
directory
.../qemu/configure: line 3788: roms/seabios/config.mak: No such file or 
directory

It's this block in the configure script which now does not find the 
roms/seabios directory anymore:

# temporary config to build submodules
for rom in seabios; do
     config_mak=roms/$rom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
     echo "AS=$as" >> $config_mak
     echo "CCAS=$ccas" >> $config_mak
     echo "CC=$cc" >> $config_mak
     echo "BCC=bcc" >> $config_mak
     echo "CPP=$cpp" >> $config_mak
     echo "OBJCOPY=objcopy" >> $config_mak
     echo "IASL=$iasl" >> $config_mak
     echo "LD=$ld" >> $config_mak
     echo "RANLIB=$ranlib" >> $config_mak
done

If I get that right, we only need config.mak if the seabios submodule has 
been checked out? So the right fix might be to skip the creation of 
config.mak here if roms/seabios is not available?

  Thomas


