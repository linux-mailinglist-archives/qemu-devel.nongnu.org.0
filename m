Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0335D955
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:52:11 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDqE-0000fG-J2
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDp8-0008SP-2p
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDp6-0003xj-JB
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618300260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3U+e9JUrUC+YgAay5b9Bl73HnXEr/p9P6zXpapz/oE=;
 b=OtH6Q72fWMpuNCvgVIca8N3nJAjfMCIhOky3yY2N/z2Kj5g7odtXNs//D8Jx1feTtfI8k2
 FqAZt+sfNIRxC77zVU+2c4ASN9TWkqYM8GrkUgttVDBzsP+QFkD3++4yUnXK8aqVLf7xHW
 PCTLCJr5COi/AnDNcN/+ce9/Ywguc54=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-0PkW3XMUMy6LYFzNPNok8Q-1; Tue, 13 Apr 2021 03:50:55 -0400
X-MC-Unique: 0PkW3XMUMy6LYFzNPNok8Q-1
Received: by mail-ej1-f71.google.com with SMTP id qx17so1862294ejb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 00:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h3U+e9JUrUC+YgAay5b9Bl73HnXEr/p9P6zXpapz/oE=;
 b=eTD8Uy7OaG+9fuv9QmPOiYmQn9F0phaOX03bNrfEDSb/msAcrfdM+SXRnAvdO9EZpx
 +5SiD9ltTglrFVqX7BVGwICAaqhyuitqAJNhJlkhBZrRTFMTrnVWQy8VeE2Q3Kcz/D8v
 z1NOPpumNl2W7vJnRukxDhdBZ9fnw7qf2tAu+rlZYFoRdeiTPlSMWFc7EGCcZLVCUiyi
 fk2P6/H6nhoc1Acs8I0OUZUDtfwKYoSA3r+sCCkLWTLvedcUYmXOBratvYuZilbnbZQM
 Ve8F58i+HuH+CDbWB3N3mfHh1WC9o63EuSlzF6bJyRUPLWe2uoweVuuqq2gKvmvo+Bvc
 6PPw==
X-Gm-Message-State: AOAM532jjUW9Nm3epbOBebf9gw5sH/1jbSK7fVUMcfGmoNqaUDUUgM9G
 LfAbmJ3TlDm5zKtVvyGrYyAJx3MWAV6yxTnS6fwOCvz0lTFmJ+s4O6Haq2ChK8IlMvCrRD54e3K
 fK3B+gWLispjpqTo=
X-Received: by 2002:aa7:dac5:: with SMTP id x5mr24459671eds.286.1618300254459; 
 Tue, 13 Apr 2021 00:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIzqkMShTUDvxomKiF13UjF++UBtaGj1U6QeqP0g7MffMVHt1SROfrWmaPS1l2wRv/vsQL4g==
X-Received: by 2002:aa7:dac5:: with SMTP id x5mr24459661eds.286.1618300254335; 
 Tue, 13 Apr 2021 00:50:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q20sm7360979ejs.41.2021.04.13.00.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:50:53 -0700 (PDT)
Subject: Re: [PATCH 0/5] blkdebug: fix racing condition when iterating on
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210408155913.53235-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4ca1d18d-0a0e-ff52-8935-5ca9fad179cd@redhat.com>
Date: Tue, 13 Apr 2021 09:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210408155913.53235-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/04/21 17:59, Emanuele Giuseppe Esposito wrote:
> When qemu_coroutine_enter is executed in a loop
> (even QEMU_FOREACH_SAFE), the new routine can modify the list,
> for example removing an element, causing problem when control
> is given back to the caller that continues iterating on the same list.
> 
> Patch 1 solves the issue in blkdebug_debug_resume by restarting
> the list walk after every coroutine_enter if list has to be fully iterated.
> Patches 2,3,4 aim to fix blkdebug_debug_event by gathering
> all actions that the rules make in a counter and invoking
> the respective coroutine_yeld only after processing all requests.
> Patch 5 adds a lock to protect rules and suspended_reqs.

Patch 5 is somewhat independent of the others; right now everything 
works because it's protected by the AioContext lock.

On the other hand the scenarios in patches 1-4 are bugs even without 
patch 5.  They become more obvious if you see an explicit unlock/lock 
pair within QTAILQ_FOREACH_SAFE, but they can happen already with just a 
qemu_coroutine_yield or qemu_coroutine_enter within the iteration.

Paolo


