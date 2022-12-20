Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80EC652665
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:40:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gN1-0001EW-Uo; Tue, 20 Dec 2022 12:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7gMz-0001EL-Dg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:25:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7gMx-0004jJ-NH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:25:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id m14so12420527wrh.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ijtElLO+/byUskeJV3oO7UriWUOlvd8NeXIY0IvFfVw=;
 b=NoZwufSuF26C4ApubJedNXIfPffmxW0VLRUpMzKXodRruMVSb1e855qhHGMBqdZGZK
 4RrEwzsy0lukhvwZkO1dCjhDAGNtPFeV/cmymyAOa+YJJBHkZUcay4x7nBNSezI1eSay
 8zfsntp2HXzOVN9fNNopYBRYKG8NyFt4VX/bpsWS/taxfUiw9GMPx9IBUXPqQtgt0H1M
 7fiWhzBG5f8UXep3yNLQtjH2y46xyYCveibxtSDZiaYlxJk/dwvkrzumt3EwS81t1rdl
 UR/AtrZ2DARrF/cya+v9FEVuc4jIUPKvEl5+ayXAEzvz/7HkSPmvD5lIT4MypDgo0Q+/
 Iy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijtElLO+/byUskeJV3oO7UriWUOlvd8NeXIY0IvFfVw=;
 b=16L0fLjRFeaZ1IZOmyYWSC2kh3p6MFuXLtIi1KkHovJVxFq7K2/PhSqNbUEUTwwE4V
 4HvuzHvGF6um3On0DDs/FCx2FPhRpBAGvxunUELSxxxtUUiP9PXFhGCcSIGMYjsQGk0u
 Xu+fsvcScSYuoKBW3EFtG49rWz9RFr7KFBXQa7wGM4/uZSNRtkNphWjYhRl/Ta+XCTMH
 SaVgH3tb4ZVZUgnKm0HhPRVmNz37YFE99Xqi6hdm42r1JWlxpkeerBGdcbW2ZE3FsLRL
 78trTWtMDP3SfwzskWxjm5m1144Epa9PqOBKcc9fImZmz+UtepGnItxVgCX6d4wRJ6jm
 h8Tw==
X-Gm-Message-State: ANoB5pmTHeH2WRPo0dVib3wq2gbz0XmD++bfA/yR3x+io4ekBpIA5AKa
 VGRYZhJRasBeN3HoxGENAaM=
X-Google-Smtp-Source: AA0mqf7nUEhnjnBkiVfk+Ny9TsBxVFUmMSCDBq3u+2yZy+H9Vc1R769QD2fUmiJ/K/9ZYSuctWiCAg==
X-Received: by 2002:adf:e903:0:b0:242:1ef7:9ad5 with SMTP id
 f3-20020adfe903000000b002421ef79ad5mr28558068wrm.68.1671557133079; 
 Tue, 20 Dec 2022 09:25:33 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4cca000000b0024278304ef6sm13130009wrt.13.2022.12.20.09.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 09:25:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f9a2d62c-8a09-7e46-6435-8ba379e95a5c@xen.org>
Date: Tue, 20 Dec 2022 17:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
 <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
 <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
 <bec6ab0c-c73e-f5f8-f4a3-e35aa0501e6e@xen.org>
 <B09974FC-9E61-4D7E-BFFF-4B2DB9C09AB4@infradead.org>
Organization: Xen Project
In-Reply-To: <B09974FC-9E61-4D7E-BFFF-4B2DB9C09AB4@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/2022 16:27, David Woodhouse wrote:
> 
> 
> On 20 December 2022 13:56:39 GMT, Paul Durrant <xadimgnik@gmail.com> wrote:
>> The callback via is essentially just another line interrupt but its assertion is closely coupled with the vcpu upcall_pending bit. Because that is being dealt with in-kernel then the via should be dealt with in-kernel, right?
> 
> Not right now, because there's not a lot of point in kernel acceleration in the case that it's delivered as GSI. There's no per-vCPU delivery, so it doesn't get used for IPI, for timers. None of the stuff we want to accelerate in-kernel. Only the actual PV drivers.
> 
> If we do FIFO event channels in the future then the kernel will probably need to own those; they need spinlocks and you can have *both* userspace and kernel delivering with test-and-set-bit sequences like you can with 2level.
> 
> Even so, I was tempted to add a VFIO-like eventfd pair for the vCPU0 evtchn_upcall_pending and let the kernel drive it... but qemu doesn't even do the EOI side of that as $DEITY intended, so I didn't.

My point was that clearing upcall_pending is essentially the equivalent 
of EOI-at-device i.e. it's the thing that drops the line. So, without 
some form of interception, we need some way to check it at an 
appropriate time... and as you say, there may be no exit to VMM for EOI 
of the APIC. So when?

   Paul

