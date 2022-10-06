Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47AB5F685F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:41:36 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogR83-0001oZ-V4
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ogR2R-0003PU-Vm
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ogR2N-0005fX-9p
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665063342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FToF/Ra7BZESu2ko5URY3Lg5CzGFytMg2E2EpxI6hW0=;
 b=fx6XBEv5ZNKxJjU6PSJNYntDEMw9BME+IFUCOS4RsWi1EB5t8sQ7ca34Kzdx9zkrf3JWQO
 wGwUcZ6KEL2H8cLaiD3arV3FoWjx8XSz5QSFkSnnpTDg9RRS+kE6SdHK/VmjeIq0oeeyDK
 xPW370XgUZ4j5EJPVTqzcvv2QS+cRjU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-teY7LFwyOceoXqiJ2nwZ0w-1; Thu, 06 Oct 2022 09:35:41 -0400
X-MC-Unique: teY7LFwyOceoXqiJ2nwZ0w-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz21-20020a0564021d5500b004599f697666so1581544edb.18
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FToF/Ra7BZESu2ko5URY3Lg5CzGFytMg2E2EpxI6hW0=;
 b=u2Q19t0U3zjP74AfMyEXpeN954NGJpBcr0QKkn6J6ekqhgarcDipTOfylkMKa3ii8Z
 M+F7GRbMoBe6j3wAiqTxA3ou+snmw+nAYhy8R6MZmLowOT8rUuZcQEYv0w2mCkGWwUc/
 Uhl7GICgWj8I89hbtgGogX87FikYCwKwlnVPgbDlcJayx74voAiwrHLQTJAbSYGe7Qei
 y4bM58xpgLQDLNSZllZF6tNFzz8j2GJq/gzrtIK2e7SQ6ILXL5njbTiO77PfFp416Ba1
 pTyxDwwbclO6uzQPgxgFUAHXWqHnGvcsq5CDuIhOc8PTouBwQzVX/OCqKoigzmhGZmXi
 pGvQ==
X-Gm-Message-State: ACrzQf1Bjn0tdi3/8Ql8gnro2R+Hy69pybnsbuXKz3osRig3dnlJfhta
 BUcfg91GDcXg7jGY1DWBceRtIzI3chHrsR18J2Epn9IJwTFJn3m8nPCLc4x0F3a1FTj4yKz/tPY
 oSkpWd/MN9fy3GsI=
X-Received: by 2002:a17:907:7627:b0:78d:25ee:cccb with SMTP id
 jy7-20020a170907762700b0078d25eecccbmr4169519ejc.442.1665063340065; 
 Thu, 06 Oct 2022 06:35:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7UJN1OWdn5zlM40cskmd48r/P8R8qgqPChqFLB5OEy/yLjISRTbcB+7np/1ixIpE/Zv309vw==
X-Received: by 2002:a17:907:7627:b0:78d:25ee:cccb with SMTP id
 jy7-20020a170907762700b0078d25eecccbmr4169502ejc.442.1665063339849; 
 Thu, 06 Oct 2022 06:35:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-124.web.vodafone.de.
 [109.43.179.124]) by smtp.gmail.com with ESMTPSA id
 l12-20020aa7c30c000000b00458898fe90asm5869253edq.5.2022.10.06.06.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 06:35:39 -0700 (PDT)
Message-ID: <6392a288-cfcd-13fe-cfe2-29c344a42f5a@redhat.com>
Date: Thu, 6 Oct 2022 15:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Minor tweak to wiki Linux build instructions.
Content-Language: en-US
To: alarson@ddci.com, qemu-devel@nongnu.org
References: <OF022D28BB.0220F0EB-ON0725887B.0076AF47-0725887B.0076AF9F@ddci.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <OF022D28BB.0220F0EB-ON0725887B.0076AF47-0725887B.0076AF9F@ddci.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/07/2022 23.36, alarson@ddci.com wrote:
> On https://wiki.qemu.org/Hosts/Linux <https://wiki.qemu.org/Hosts/Linux> the 
> list of recommended packages currently is a mix of RedHat and Debian names.  
> I suggest the following instead:
> 
> ==== Recommended additional packages ====
> 
> Package names are for Debian(RedHat).
> 
> * git-email, used for sending patches
> * libsdl2-dev(libsdl2-devel), needed for the SDL based graphical user interface
> * libgtk-3-dev(gtk3-devel), for a simple UI instead of VNC
> * libvte-dev(vte-devel), for access to QEMU monitor and serial/console 
> devices via the GTK interface
> * libcapstone-dev(libcapsone-devel), for disassembling CPU instructions

Looks like nobody took care of this yet (sorry!) ... so I now went ahead and 
updated the wiki. Thanks for reporting this!

  Thomas


