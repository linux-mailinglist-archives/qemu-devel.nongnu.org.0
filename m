Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDD33C270
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:48:58 +0100 (CET)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqOn-0005vj-1k
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLqKG-00039k-2w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:44:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLqK5-00033H-Ix
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56ZiSQR2jq2tpkK3vSnnVJXYJ1969r1srvA9PuYPXHo=;
 b=LfWGrkkCTsfze0x+hvX6Tz76wKRQU+H+vgfFj7bSYxgU1o7Vxb0FcxjtieHpoSU/6Frg3F
 M8hUBKsqfTEQgVqVDXTUwz543MLqEDYI58iqJ+UEgQenKo6prOkffX/bGcIIOV/soM5ZN6
 UQvMTu6FhvXzr6oQ1YboMCubk0xZfrk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-KEEU7qcRMKitD-g68C35tQ-1; Mon, 15 Mar 2021 12:44:01 -0400
X-MC-Unique: KEEU7qcRMKitD-g68C35tQ-1
Received: by mail-ej1-f72.google.com with SMTP id fy8so12274040ejb.19
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56ZiSQR2jq2tpkK3vSnnVJXYJ1969r1srvA9PuYPXHo=;
 b=CYYfw5DZHmyoXZwrDInRjtNKXdrlfssHCzX/lY+0P+XqhvQ5oxY+z7TMKaGk/pDPXp
 3ACXj6qrDSdiGdbvrnXkzEfwWYK/ycTxi57H1vBwerOjVEuFyNHnyRNzJuP6z0lYaLF2
 2AATJTjPlERbOwKzulUxgK5CJYSOmwRMS61uN0XsOQOvqqUElDxuyr+vwhrKYuIWm46d
 La/LswjxpV8LfOO52DqBqonyeDybdMFguL9BqIfzTSFXSESGZ6PmhhubV54xkyaKhU4g
 kAQEMYU4KXbcKGGR5yNDf9fciMf6JSL0Z5HLbgFJgket1pEGMp6RySK5QoWa8DM71mew
 prSw==
X-Gm-Message-State: AOAM530Iw2qwT+XAqlMufvkEhzoYuVFyXYxoeqsq45+10I3iDxMrtBwU
 9czUAsFyymh9gj7IhclSqroE9Iz5lNIv2J3vKZyOVRFeHCv5bmkQyBjSKAcR3ZGuUWGz6AanA+w
 DUBAYqLqqIROIPc0=
X-Received: by 2002:a17:906:b0d8:: with SMTP id
 bk24mr25288088ejb.252.1615826640194; 
 Mon, 15 Mar 2021 09:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBJJYFoJ+v52SlTYk5j0sQxDoeflb+6cnHMhIzoaUVpmVYEc4ang1ezDO4w24o0GBTDrKcfw==
X-Received: by 2002:a17:906:b0d8:: with SMTP id
 bk24mr25288070ejb.252.1615826640062; 
 Mon, 15 Mar 2021 09:44:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id c10sm8522519edt.64.2021.03.15.09.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:43:59 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
 <a137ee82-9ef6-dcd9-0b39-6a0257514e78@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: compile warning in i8259.c
Message-ID: <8ad75667-9d31-a046-2ed9-a2ea53bb1cde@redhat.com>
Date: Mon, 15 Mar 2021 17:43:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a137ee82-9ef6-dcd9-0b39-6a0257514e78@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 16:55, Philippe Mathieu-Daudé wrote:
> Since you ask, I'd love to have things solved differently...
> One PIC has 8 IRQs, so we should model 2 cascaded PICs as 2 cascaded
> QOM PICs. But this code is so old and heavily used that my desire
> is unlikely to be realized. And your patch is simpler :>

They are modeled like that, see i8259_init.  Perhaps you mean that 
pic_read_irq should call itself recursively on the slave PIC if irq == 2 
&& s->master?

Paolo


