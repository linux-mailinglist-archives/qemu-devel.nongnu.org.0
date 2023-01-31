Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB268261C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 09:04:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMlbk-0006zm-CV; Tue, 31 Jan 2023 03:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMlbh-0006za-Oc
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMlbg-0003kJ-8J
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675152187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QKf5xGCBD2PaMdwLvrkQa2h3l3GTpYayivkjmZpFmk=;
 b=QajXbS+AskZdwKYQul4Yeap/YsSenenRbiazxCe97JP57JcGH90OTROfbZxvEawVtFDnav
 uWDxoVNYE+PvPDYdnlxojtVbg+f1AiRn7SuHEh/PrjXwtRb6mSYjxwFtRVjE5jNH0miXNY
 FTNjdgG1kvFepaC76bVUnUEB+l+X1Xk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-5N6AdMiUM1-Upzk_kMKGeg-1; Tue, 31 Jan 2023 03:03:05 -0500
X-MC-Unique: 5N6AdMiUM1-Upzk_kMKGeg-1
Received: by mail-qt1-f199.google.com with SMTP id
 bp43-20020a05622a1bab00b003b63be6827dso6285653qtb.23
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 00:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3QKf5xGCBD2PaMdwLvrkQa2h3l3GTpYayivkjmZpFmk=;
 b=GVDIzJuTTWEGg5dpxvlWcjTonbrDKPwZkKcU7APc0DH1BSKGrgJVxqpvsLdWwSKQlt
 mxwytC0HL8euUkoAhhuUp/6/PgDPe6qWmz7a+bxvMeZakNYwvS9ZiMZTs0AVHhwHnyxL
 HAeruYGhOEsSZx8eOg8FSw3FbAo93fvFw0PL8AghzLYMM9uGthbYg6D3jaefknUjQPE/
 3GfsrMIMXz3IQEjcuVu+KZDXWhB+dVRnCXW7a5IcKYTDK8VaHBwxTK8VbvrHaWd6xVJp
 hqGTJStFp/FY2UhIs9Tok/ZMi+RIQJRZlDV1WH+bi1id8JueAqkwX88VSxNETCYYDouF
 0U2Q==
X-Gm-Message-State: AO0yUKVpbKHJKxfQjwbxWyd9nrEcMFEOzK6g61DCMDuGtlccGA/dhRar
 onnnWzZjt3ctKjCX7HKH+7QxIKWWPiql8TqOxXVelXmtc/QjI9g8EEFg7+hahnrxrg63xsFICtw
 w315ni/6ZvvkftVU=
X-Received: by 2002:ac8:5c88:0:b0:3b8:6868:2ab4 with SMTP id
 r8-20020ac85c88000000b003b868682ab4mr10263449qta.49.1675152184902; 
 Tue, 31 Jan 2023 00:03:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8GAr/BFDOmiv5mGn/qHTbjrKaeiuSNSFUwWtfcmVZF8vnncw424NwEvljkRkC2333PDck6vA==
X-Received: by 2002:ac8:5c88:0:b0:3b8:6868:2ab4 with SMTP id
 r8-20020ac85c88000000b003b868682ab4mr10263436qta.49.1675152184711; 
 Tue, 31 Jan 2023 00:03:04 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 q187-20020a378ec4000000b006f7ee901674sm5736363qkd.2.2023.01.31.00.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 00:03:03 -0800 (PST)
Message-ID: <a3946352-1106-d94e-a21e-e4c660c834fe@redhat.com>
Date: Tue, 31 Jan 2023 09:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] gitlab-ci.d/buildtest: Merge the --without-default-*
 jobs
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-5-thuth@redhat.com> <87sffsgnhn.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87sffsgnhn.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/01/2023 14.28, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Let's safe some CI minutes by merging these two jobs. We can now
>> also drop "--disable-capstone" since the capstone submodule has
>> been removed a while ago. We should rather tes --disable-fdt now
>> to test a compilation without the "dtc" submodule (for this we
>> have to drop i386-softmmu from the target list unfortunately).
>> Additionally, the qtests with s390x and sh4 are not read for
>> "--without-default-devices" yet,
> 
> Fyi, I've been working on a series to make the qtests work with the
> --without-default-devices build for i386 or aarch64.

Great, I'm looking forward to this!

> There are some qtests explicitly adding devices without checking and
> hardcoded defaults on vl.c and machine init code without a matching
> KConfig dependency.

Yes, I also noticed this while working on these patches ... many other 
binaries even don't start since they try to instantiate a default NIC that 
might not be available ... fixing the whole of QEMU will certainly take some 
time, but if you get x86 and aarch64 working, that's certainly a good start!

>> so we can only test mips64 and
>> avr here now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>

Thanks!

  Thomas


