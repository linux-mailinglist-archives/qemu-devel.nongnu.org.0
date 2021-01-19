Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DAC2FB5F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:06:27 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pmE-00046r-IX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1pjp-00035Y-SX
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1pji-0004BP-N8
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611057829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tc1IoCYo3KqjScsmcxDG3cYlruTwEqGpQmTaQJAYXpw=;
 b=O8oU8pcjXxjcX/NDwACkSmJknJfRy41965pYpisY+8+fjncKjYNZ4vRo2kez0ZzHxTqkZa
 Bl0wBsKmcFPhwvBEqzWau/VX7gTrMNsJH3cLOxoJlA88/X5/pRp/UrJddlKffWISyrHKnH
 Hl6ikeeP9zFfbt7+VlXwpZjsAKdWvHo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-144RJ3CPMyGVsyDt15eu4Q-1; Tue, 19 Jan 2021 07:03:48 -0500
X-MC-Unique: 144RJ3CPMyGVsyDt15eu4Q-1
Received: by mail-wr1-f72.google.com with SMTP id v7so9727881wra.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tc1IoCYo3KqjScsmcxDG3cYlruTwEqGpQmTaQJAYXpw=;
 b=PFk0M3fWRovU5R8Oka1UkNeCwmcdr1LlkqkBPeJulsl130PecIy4KIpJpvRuxt0kt7
 +TeNVptebk/DNkXw36qwGOq630CKZOLNDDHjjJubVD58zCQSHvJXSnQC6yrlkCh+YqZi
 HNJBRsXZoqKIOWHhVmqvnfqbv0ToGxRENr3VadDLnAKh2X47WCsE5bt3HIPRPEInAMtT
 Tko3QTSdIAzZDwq2hwOZ29yiLFy/Uju39yJYulOkje1uWwBICsbsgSg1oc3HkJsUPCsL
 IqCiXfNINbwM8byRDgVGexaenXJTQ+X3cMSGhU4FmMgXeQWIemGKaNIau9x5ZxdyDTjB
 7SlA==
X-Gm-Message-State: AOAM532MNGAhq0XHrHaH8Tec0kMQ6t7DyLgvSSik8KJzzHO2tJZFx8iA
 KAwyDZDawf1cBm5xthB2gdL8pNpxU+v/Af9UEk8EX/fXqT2q47gfeYqCAytLuFhXNhhBWae3D4/
 C/VU2MYeYRr7+i7H27GvuAEsUhPUgt71LclpTgwKQctkMzEak5TIfe25kJHUKD4hbOLg=
X-Received: by 2002:a1c:b682:: with SMTP id g124mr3824138wmf.10.1611057826700; 
 Tue, 19 Jan 2021 04:03:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMicF8IGGS6y3yDaX33+DTBcNWWU3yy24gv9ZuHouu3Vsi7N5NUdGJzcAN7idS+t1fyJQXIQ==
X-Received: by 2002:a1c:b682:: with SMTP id g124mr3824111wmf.10.1611057826473; 
 Tue, 19 Jan 2021 04:03:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z63sm4443199wme.8.2021.01.19.04.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 04:03:45 -0800 (PST)
Subject: Re: [qemu-web PATCH v2 00/16] Re-design the QEMU home page to better
 present information
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201027132015.621733-1-berrange@redhat.com>
 <CABgObfZ+grQAax+dAJ626kTSHrC8mzwu9CPjNHcNaRxbbn7C7w@mail.gmail.com>
 <20210113145712.GE1568240@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2812eec6-d7e9-8780-1a10-d66f312def3d@redhat.com>
Date: Tue, 19 Jan 2021 13:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113145712.GE1568240@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 15:57, Daniel P. Berrangé wrote:
> On Wed, Jan 13, 2021 at 03:54:51PM +0100, Paolo Bonzini wrote:
>> I am going to apply patches 1-3, so that I can play with doing the
>> final deployment via gitlab pipelines.
> 
> Probably worth taking the 16th patch too, since the CONTRIBUTING
> file described how to use the CI results.

Done, thanks!

Paolo


