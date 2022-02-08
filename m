Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE84ADC5D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:20:17 +0100 (CET)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSHu-0003qe-3t
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPbl-0006ea-I2
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPbf-0002ZX-Kf
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644323304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lObedK0P63aDQ7vm9wEmi1YtmLEg86yWn+BiTdS7RGw=;
 b=MCas+yoK6TyUHnFPIxIBBQfMJurfwWiW63j5/cbTWWuKV6s22KqI5j2eufcFlm7uD89kQF
 BbHsyWqv+k3lfDBQKRobS/qI/EiJhsNuQvnaeqTrrXwgBDwvqmkpyVccoUpTokrnasUmJX
 X1YEy0iAM9QvqB0nsZz08g3f48sQKYI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-ItUc-ArwOTiUiNGHVIuGWA-1; Tue, 08 Feb 2022 07:28:23 -0500
X-MC-Unique: ItUc-ArwOTiUiNGHVIuGWA-1
Received: by mail-ej1-f71.google.com with SMTP id
 l18-20020a1709063d3200b006a93f7d4941so5694983ejf.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lObedK0P63aDQ7vm9wEmi1YtmLEg86yWn+BiTdS7RGw=;
 b=AN39tdGNMM4SRlQqARpsBXeIqDfwbzGArfTpW21/TIT9uKzcstgqhEk30XiGuHoR7J
 IMx1J1joch4MbPuDR+BAyFq65laJswmJAzNMZiAAUxdB+cWvW8NECKLn1i6IZRhgTo3m
 7OP33yViU3bvwMRoiY2Vs/nckEmCNtmQw81TGM0kXRnz3PN4emtJKxCBfFDZjFT1ZcKo
 waTmiIsdiTzhn3i3peGo3ieSBFvoho1HQIVZqRu+6kzOPNhS8WLM3CAEGSFsw+CxOjcg
 IcskatQCaKLYiKRpOgxyR1o/lhiZGfYya2RXWoo4hGI3MsZknpsUqW3NBUro1AJRNwiE
 Tclw==
X-Gm-Message-State: AOAM532qbXc7H0h/ZI4w0nuJGBeudCusS60BhiovNIVb9LjtgkRYMe0i
 MI9Ieu2qyJBxJC3FbwMl+e/Nly0Vojqkweg91LChvUiKqfrauBmloLAyx9fbWtAVpyFrf12RnlX
 AayN4MBL98i/ZCKc=
X-Received: by 2002:aa7:dbcc:: with SMTP id v12mr4153307edt.263.1644323302014; 
 Tue, 08 Feb 2022 04:28:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUlA3pXFZizz4jBtde0OOGspC6QGFDBg6Tl5pA18ZNx0JlDmCUPoLjnDLtbDiZ2S8fUaXjgg==
X-Received: by 2002:aa7:dbcc:: with SMTP id v12mr4153287edt.263.1644323301751; 
 Tue, 08 Feb 2022 04:28:21 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s16sm570908edt.91.2022.02.08.04.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:28:21 -0800 (PST)
Message-ID: <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
Date: Tue, 8 Feb 2022 13:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
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

On 08.02.22 13:13, Thomas Huth wrote:
> On 08/02/2022 12.46, Hanna Reitz wrote:
>> On 08.02.22 11:13, Thomas Huth wrote:
>>> Instead of failing the iotests if GNU sed is not available (or skipping
>>> them completely in the check-block.sh script), it would be better to
>>> simply skip the bash-based tests, so that the python-based tests could
>>> still be run. Thus add the check for BusyBox sed to common.rc and mark
>>> the tests as "not run" if GNU sed is not available. Then we can also
>>> remove the sed checks from the check-block.sh script.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   tests/check-block.sh         | 12 ------------
>>>   tests/qemu-iotests/common.rc | 26 +++++++++++++-------------
>>>   2 files changed, 13 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>>> index 720a46bc36..af0c574812 100755
>>> --- a/tests/check-block.sh
>>> +++ b/tests/check-block.sh
>>> @@ -52,18 +52,6 @@ if LANG=C bash --version | grep -q 'GNU bash, 
>>> version [123]' ; then
>>>       skip "bash version too old ==> Not running the qemu-iotests."
>>>   fi
>>> -if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
>>
>> This specifically tests for `sed`, whereas...
>
> There was a check for "gsed" one line later:
>
>  if ! command -v gsed >/dev/null 2>&1; then
>
> ... so the check-block.sh script ran the iotests also if "sed" was not 
> GNU, but gsed was available.

Oh, right.

>> [...]
>>
>>> diff --git a/tests/qemu-iotests/common.rc 
>>> b/tests/qemu-iotests/common.rc
>>> index 9885030b43..9ea504810c 100644
>>> --- a/tests/qemu-iotests/common.rc
>>> +++ b/tests/qemu-iotests/common.rc
>>> @@ -17,17 +17,27 @@
>>>   # along with this program.  If not, see 
>>> <http://www.gnu.org/licenses/>.
>>>   #
>>> +# bail out, setting up .notrun file
>>> +_notrun()
>>> +{
>>> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>>> +    echo "$seq not run: $*"
>>> +    status=0
>>> +    exit
>>> +}
>>> +
>>> +# We need GNU sed for the iotests. Make sure to not use BusyBox sed
>>> +# which says that "This is not GNU sed version 4.0"
>>>   SED=
>>>   for sed in sed gsed; do
>>> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
>>> +    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > 
>>> /dev/null 2>&1
>>
>> ...this will accept `gsed`, too.  The problem is that many bash 
>> iotests just use `sed` instead of `$SED`, so I think if we let this 
>> do the gatekeeping, then we should change this to just check for `sed`.
>
> I think we should be fine - at least for the tests in the "auto" 
> group. Otherwise we would have seen test failures on non-Linux systems 
> like *BSD earlier already.

Makes sense, but I’m quite uncomfortable with this.  Can’t we just do 
`alias sed=gsed`?

Hanna


