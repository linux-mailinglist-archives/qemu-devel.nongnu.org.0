Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397754ADAF8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:16:19 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRHy-0006I3-Ml
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:16:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHOwt-0005fc-Ed
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHOwq-0003GI-UG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644320774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+cdHNnubsdshZ6PCh7WIdsZcDP0n/9BKG/ZAisPjvg=;
 b=gwHdmyz6/mFtxJJZOOnf5lq3iit4Sfi+nD5PMuimPVVNK6frQHsyfoc5pZxRf5rm1v4LEe
 gg5ow9bqseZXp9BzH1fdCz6fHrJU9OWGJ2WcJn9Ta5XnsQ22PsuxiWVVHFnnORpTQJaVEd
 5lKecTGRt6FrkZFAkJ26gWUfdfex7hA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-f2gTp43RPKCJVoAJ_KbiRw-1; Tue, 08 Feb 2022 06:46:08 -0500
X-MC-Unique: f2gTp43RPKCJVoAJ_KbiRw-1
Received: by mail-ej1-f71.google.com with SMTP id
 lb14-20020a170907784e00b006aa178894fcso5632894ejc.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+cdHNnubsdshZ6PCh7WIdsZcDP0n/9BKG/ZAisPjvg=;
 b=XG7och6EGQ99SgnyBZPvdRyR/hEE73KQZg6BvJ9QXoqHxJHLSk4QJgnBlGYjisXRcG
 hlOIOwC5jCKmFZ4AqKFpKtWt1CjweTziFYiXEJZ3dxzzJ+vNKR55+/qxDD2CiF3WI2On
 2x01JSnq6lP5yOXG8q2Eyg34F+S8m8UYCwQOLboW9cAczLsgK9hh9V3qtv3/vEVXUWkM
 9QJipusJ8KBdZT6QnQmXy/IX9k26FeOdTbhfzolcMGGLZPgIeghe77XBQ0BMNHaWq+dk
 1juMXxHCaiT/xvO0uEqBWH88obE7MkKz7LtK9wWKLW6XXKEZBC7pijiC241HVJtH54zn
 EvjQ==
X-Gm-Message-State: AOAM532LX9r+9y7KTEf7PUzkl2U05IEopAROv9I/OTipLCdAn3FOliU9
 KTKxzy4lBaJBnCJUlKkWLdQPUJDK7dOvSfQlgYgiQc8afjmFsyfI299YR4steOQij/GEkVLcB28
 vhemUPCjwRpxEiZk=
X-Received: by 2002:a17:906:a899:: with SMTP id
 ha25mr3374553ejb.164.1644320767264; 
 Tue, 08 Feb 2022 03:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCaxaQYtZFHA7/gVWWynQeSMMLsX84nbXCPAh8ee6nfU+1bsNcz7/wls/oIkaJvFZLd01M8A==
X-Received: by 2002:a17:906:a899:: with SMTP id
 ha25mr3374540ejb.164.1644320767035; 
 Tue, 08 Feb 2022 03:46:07 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id ck9sm965342edb.61.2022.02.08.03.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:46:06 -0800 (PST)
Message-ID: <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
Date: Tue, 8 Feb 2022 12:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220208101311.1511083-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.22 11:13, Thomas Huth wrote:
> Instead of failing the iotests if GNU sed is not available (or skipping
> them completely in the check-block.sh script), it would be better to
> simply skip the bash-based tests, so that the python-based tests could
> still be run. Thus add the check for BusyBox sed to common.rc and mark
> the tests as "not run" if GNU sed is not available. Then we can also
> remove the sed checks from the check-block.sh script.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/check-block.sh         | 12 ------------
>   tests/qemu-iotests/common.rc | 26 +++++++++++++-------------
>   2 files changed, 13 insertions(+), 25 deletions(-)
>
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index 720a46bc36..af0c574812 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -52,18 +52,6 @@ if LANG=C bash --version | grep -q 'GNU bash, version [123]' ; then
>       skip "bash version too old ==> Not running the qemu-iotests."
>   fi
>   
> -if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then

This specifically tests for `sed`, whereas...

[...]

> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 9885030b43..9ea504810c 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -17,17 +17,27 @@
>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   #
>   
> +# bail out, setting up .notrun file
> +_notrun()
> +{
> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
> +    echo "$seq not run: $*"
> +    status=0
> +    exit
> +}
> +
> +# We need GNU sed for the iotests. Make sure to not use BusyBox sed
> +# which says that "This is not GNU sed version 4.0"
>   SED=
>   for sed in sed gsed; do
> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
> +    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > /dev/null 2>&1

...this will accept `gsed`, too.  The problem is that many bash iotests 
just use `sed` instead of `$SED`, so I think if we let this do the 
gatekeeping, then we should change this to just check for `sed`.

Hanna

>       if [ "$?" -eq 0 ]; then
>           SED=$sed
>           break
>       fi
>   done
>   if [ -z "$SED" ]; then
> -    echo "$0: GNU sed not found"
> -    exit 1
> +    _notrun "GNU sed not found"
>   fi


