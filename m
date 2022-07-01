Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E562996
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 05:37:29 +0200 (CEST)
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o77TE-0007xH-GU
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 23:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o77Qj-0006YR-Ed
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o77Qg-00084L-9y
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656646488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvqrglYmWMpHTlxdBfbogI6IwA1S2CaRROfuj/Dcr1U=;
 b=cxPiZDPq21fv0DghwMXbsM8oT7zCjATLbrXqcdnvR5t9VG3Ns00/9HqEfE9l69wdOqU/kM
 eITeZZz9U22kxuN7BRnPyfDLYzJ3+w9H4kvz/aZTGvGS4sGyVQJ13fnVUH2hdEQma6O4ii
 nelg0jQR7oSnSyJFhu9jMuVZ+UdEHZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-_L8LyEvDPoiqSs60zdWS3A-1; Thu, 30 Jun 2022 23:34:46 -0400
X-MC-Unique: _L8LyEvDPoiqSs60zdWS3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso706048wms.9
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 20:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nvqrglYmWMpHTlxdBfbogI6IwA1S2CaRROfuj/Dcr1U=;
 b=YK/zQBgbHDwr8jB38HTVflstKG4EPwptePvFiSBhbOLpxT0YKxMJTQefARmfBiUSjx
 G8qhXZnXlJFu1N7f/VK5HqhiXF7tOmMEgyerS/niQIS+Wz3dgqBljC50xjs2j1WQjm5L
 9l6lyw+Xz270m+kU0D2M2oXp1mvRsX+JT7cxcq7ydsOYNWVLMPFV/3bRP6A1Is3XE9k+
 UQ+niOAnQCos8udpOCTt7+k3zL4aJafzySX6SiLaOoGPjkRy0NmSjdQnrwA5Stfe5/Gv
 g9MEgo6hD8Cxp329jWntrfdPOTr1M3cpwiLW1CKCZKn+MNCg91NacgqjgC30ZtphHtXW
 ymrg==
X-Gm-Message-State: AJIora9Gbxm3qrO4+D/e8TqfxccaeXjNHicLn28f/VtYEwhVrHV6gamo
 PlRcOBwZJ6wXOinQvwkzR5BjSd0D3kSAMdcUWto6n9tY0BI4vMKVmpD4z52I5GVlf0nvLEO9pGI
 c6zwts4/p8hBbbbg=
X-Received: by 2002:a1c:f318:0:b0:3a0:3015:3604 with SMTP id
 q24-20020a1cf318000000b003a030153604mr15324613wmq.180.1656646485351; 
 Thu, 30 Jun 2022 20:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEuo3U+v4gSmFu7pwchDYdX3EKRScdlXi+PSlcyyKERH6dfE1uGRO75oW1VgRJDRYuZ4alZQ==
X-Received: by 2002:a1c:f318:0:b0:3a0:3015:3604 with SMTP id
 q24-20020a1cf318000000b003a030153604mr15324594wmq.180.1656646485120; 
 Thu, 30 Jun 2022 20:34:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-162.web.vodafone.de.
 [109.43.179.162]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d4443000000b0021b8bb97a47sm19954469wrr.50.2022.06.30.20.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 20:34:44 -0700 (PDT)
Message-ID: <e30713c5-eece-f54d-201e-6f99ae52e11e@redhat.com>
Date: Fri, 1 Jul 2022 05:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Why we should avoid new submodules if possible
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
 <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
 <YrspCYpLwFDHkaRv@redhat.com> <20220628135133-mutt-send-email-mst@kernel.org>
 <CAARzgwwoNUn2pN9uAn-sqrH42dsOW4WQyc6ZuewRPPovUqykMQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwwoNUn2pN9uAn-sqrH42dsOW4WQyc6ZuewRPPovUqykMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 29/06/2022 08.28, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 11:30 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Jun 28, 2022 at 05:15:05PM +0100, Daniel P. Berrangé wrote:
>>> FYI, the reason much of this is intentionally NOT under the /qemu-project
>>> gitlab namespace is that we did not want to be responsible for distributing
>>> arbitrary binary blobs/images. That in turn makes the QEMU project responsible
>>> for license compliance, which is non-trivial todo correctly for much of this
>>> stuff. As such it is highly desirable to delegate both the hosting the
>>> binaries and source to the third party who builds it.
>>
>> This might be understadable for random guest OS images which include tons of stuff
>> and are thus hard to audit.  But not to biosbits which has its own
>> license (more or less bsd) + gpl for grub:
>> https://github.com/biosbits/bits/blob/master/COPYING
> 
> These are all the dependencies:
> https://github.com/biosbits/bits/tree/master/deps
> 
> We can go through the licenses for each and make a determination. The
> audit would be lost easier because there is a bounded number of
> dependencies for bits.

That's quite a bit of dependencies already ... I don't think that we should 
put the burden of keeping up with the licenses of those projects to the QEMU 
project. So just make sure that the binaries are available somewhere and 
then include your test into the avocado framework or download via curl/wget 
as suggested in other mails.

  Thomas


