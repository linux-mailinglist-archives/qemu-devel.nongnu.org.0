Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED54333F6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:51:32 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmiR-0000Ff-6t
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmgu-0007gG-Dc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmgr-0008Gu-Vh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634640592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMxtrNFG0gW3Xw8LtpS3/KIiM1tUrGvy/pNxtJBMaoU=;
 b=A4fKL0cn/mfn1wtrkqwT1AI3U5vDLVmgJ+eYfMgG0T1cJ9deWy1utNVo1C91qO+4y1Dh38
 2axpAJ3daq3CFrgAX7dc+Q0CS/FGP/ca5i9LMzZiLCxE0kkwFM+hcjeaAvA9e5DL8m90D8
 S9L4NMvj89zTFi+LItKcoTOQzeaQj0s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-lMHmluEYPMqpJezftEKiSg-1; Tue, 19 Oct 2021 06:49:51 -0400
X-MC-Unique: lMHmluEYPMqpJezftEKiSg-1
Received: by mail-wr1-f70.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so10026484wrm.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WMxtrNFG0gW3Xw8LtpS3/KIiM1tUrGvy/pNxtJBMaoU=;
 b=hNgRHUJGr45UD6Zdr93CyR+Ik0e5zxN7aw+tZ+fEQx2Zb5yc38nGT4UdVAgwOVN0Ii
 vd9Jryn/ffDmsRicWRhBKz8O1t/oTzAqaDnes1iqGNMe0iEHrgx10p+c2JJEQR8L9sZS
 Zjos0RaRzszj61v69R7c5GzeHFVSV2IvFZDBl3Dk9YfZBHZFaMFlKxB+qlxdoapt8jOW
 r7zP/WDmTff5CK5L4iLoRlmdWg3kx0nDAmUGXLG8jQVSOdIY3dXcIrlnS3CYd0ueZqZa
 c8RSBKIXWWuUliXf0jfHpl7gkD4FtlYPwglTRH4+HHgemwD/EsHYvMHloPG0gfz+yDMt
 ISBA==
X-Gm-Message-State: AOAM531VnSYjDCQhprYw248l2CjiZIzMERjUAQ2aPSVeEY5duS+qPRnD
 Pw00Y1t55nm21PmVrC8XoiTqtYHcQxcLsiZJggMUKwtgdNDylOZMJ39AIq3zFw8Yz2pZ/Dm9Jnh
 3ATbMSdt7Rf5/f88=
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr5178356wmd.156.1634640590275; 
 Tue, 19 Oct 2021 03:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZWrEDJS7lPHEIGC0B7rPbu/ALazo80kOD+AR7k+FhK0LHgehjJOr+UdL1k93D/rqOhiiFGw==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr5178338wmd.156.1634640590097; 
 Tue, 19 Oct 2021 03:49:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id 196sm1866194wme.20.2021.10.19.03.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 03:49:49 -0700 (PDT)
Message-ID: <1cb1a05d-d96b-198e-771c-79f7cc26ee1d@redhat.com>
Date: Tue, 19 Oct 2021 12:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com> <87sfwyz8n8.fsf@linaro.org>
 <726ce2e3-71e9-639e-df62-6f1cdbf8c1fc@redhat.com> <87fssyz1se.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87fssyz1se.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/21 19:20, Alex Bennée wrote:
>>      shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> I guess this is it? I couldn't follow the chain of qemu_opts to find
> what sort of change -no-shutdown made to the shutdown_action.
> 

Yes, "-no-shutdown" is short for "-action shutdown=pause".  From there 
it goes process_runstate_actions -> qmp_marshal_set_action -> 
qmp_set_action, where it sets "shutdown_action = SHUTDOWN_ACTION_PAUSE".

Paolo


