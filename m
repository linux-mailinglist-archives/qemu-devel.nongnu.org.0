Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7C424840
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:49:58 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDrR-0000VY-8C
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYDnF-0005qO-56
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYDnA-0002yP-Rc
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633553130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7e83BovDmV4FWEAygs/8iu96+bCd8fAgvepcOkCpC4A=;
 b=Oo4mwIl47nuNHJATu4h34oej3M17kgrIL9WzZiqwn+931ndGJnFjIRovGWS1vNCNGzTD2L
 dIEQvU0c4DG/9vVKKNeeziWsMP557rA2bk3XFxkpR9FWaOPpyXQ2MfpFFPRAnUmnpShqze
 l2qpa2BWmvhHJcHxnTL4eZdbmcoD4dA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Ct5MkqEJNWub0f0JCgF-3Q-1; Wed, 06 Oct 2021 16:45:29 -0400
X-MC-Unique: Ct5MkqEJNWub0f0JCgF-3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso2988586wru.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 13:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7e83BovDmV4FWEAygs/8iu96+bCd8fAgvepcOkCpC4A=;
 b=3F3rYCBY4S5PwkttW9yslhFMa9c7GosGWfITic8M0WlgSxSSUMYmg56dSfcrz0b9lg
 kMvxMo3xB4zvlZ2oNd2uxqO9SdJy5FV4kkOIlBPlprDvg5QhCtbncJe3q6sxwfLhSm4l
 LisG5heL2A+6ZywtBgYCfki5ezPvQfUcWjJ52aMtnEYWWdN5oBC2iRkmquhw6g0S5ZqK
 5pHi8O+QxUya6UQLyQLf9FacdMku6350+VaHRVRiZXqINo0Z+3afmxT6SdS3aj76GZGY
 vHws9KzqiZyMwXBNNYng72K5G+Y7MOC88ME58hm0xFcRAXLEhLbgZ6lv6pCeRhfti91A
 QvtA==
X-Gm-Message-State: AOAM532sdt09ymbqJAIZ3YHrhBB3Vwxl8UHtmeXnAey3NBOvU2gA06Wp
 s6+C2/96PtRtXAzAFPWf68pG1qqyyNvqR6qvfPL14zPB0naz+G2lCcZaCwl/e6dfMYhOX8V/hz3
 rv5qI9m/INziFcxY=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr335258wrz.29.1633553128403;
 Wed, 06 Oct 2021 13:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTtObekwMqUOWYKeA/QxlvvVqbtBBCPF4LfmN4YsrbE1kp4rcMK3+wFfLt2ssE4xuxPV/Aew==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr335225wrz.29.1633553128198;
 Wed, 06 Oct 2021 13:45:28 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w7sm9937454wrm.54.2021.10.06.13.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 13:45:27 -0700 (PDT)
Message-ID: <3f2c527f-fa01-7994-00ef-026ac6e63471@redhat.com>
Date: Wed, 6 Oct 2021 22:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 14/22] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-15-philmd@redhat.com>
 <86b19b44-a8e2-af97-2b96-8cc21ed1be34@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <86b19b44-a8e2-af97-2b96-8cc21ed1be34@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 10:23, Paolo Bonzini wrote:
> On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
>> Move qmp_query_sev_attestation_report() from monitor.c to sev.c
>> and make sev_get_attestation_report() static. We don't need the
>> stub anymore, remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> This was done on purpose, but I have no objection to changing it this
> way.  We might in fact remove the indirection for SGX as well, and/or
> even move the implementation of the monitor commands from target/i386 to
> hw/i386 (the monitor is sysemu-specific).

OK about SGX, but in another series, this one is already painful enough.

Not sure about moving monitor to hw/, some commands expose hw info (like
info pic) but some others expose architectural features (like info sev).

> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thanks,
> 
> Paolo


