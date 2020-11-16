Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60122B5227
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:14:49 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kektk-0002o4-Qx
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekkz-0008JS-Fk
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekkw-0004RM-TM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605557140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIfBW6FTALYlIOp6kRirtbdfk7c8A0JcDE3cwh3uLzA=;
 b=bNuzosj4xY8IJjdZ6NSHgxqV7znj1vfT9uwUjNWrRBu9Yma7lRo6sf7o3xhjF0wTweyRoL
 rggAS9IJ5Od1zHj3QPXuT62J34BDxcJ9s9G0VQRbYyF9agbAH55kDZUWK/EhtTOORxWayD
 EmEhzZw1Qk6p7hsqlfdt/16v61L9ehI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-Mw1yNyDdNAaJjFpXYyaJWA-1; Mon, 16 Nov 2020 15:05:39 -0500
X-MC-Unique: Mw1yNyDdNAaJjFpXYyaJWA-1
Received: by mail-wr1-f71.google.com with SMTP id x16so6872522wrn.9
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 12:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AIfBW6FTALYlIOp6kRirtbdfk7c8A0JcDE3cwh3uLzA=;
 b=QNh8ZZWGbhH5LKclFpohhomPr842YJguD6feZfl4XLp4yIUVlTXjioh/lpJqGE+9jT
 sPtNx7g8OBEaG3PkpOhbqOV0ACjlwp6yNuK/MROq4h2P1i3z2jBilNk69Xpfc/LuonS8
 sBCqVwPlBYbJw4CzQ3lgvSDN1oAHW4IIntKXWo97tzBqSwWZtaxEfbCSWUegMQskiQXF
 EjA/gbM6GB3xBs0M0LiJFgGPsxSZHeGAcwLLjAuvoz3lnafW78PNXaoZAzY0HDd2zdk/
 Oo07Bf2I+OyLCXX2ktgHNMWaouh1aD3z9hoXhxQJRBXorZ2zJF/RYVwHuT3Xsw56p2VS
 kDQg==
X-Gm-Message-State: AOAM532ASJdKDXh3D+f65gHz5SQY4kq2mOmVQkVK5EXRsuIMyyF1iKsV
 hgKjdnzLVmDs8fTM+w60tEGaYMUcJu4eWqVTql1d8Gr6EiZtgHA9nOeH5Tc4nDSwQ7Ocx88B/V8
 nUQqZhh+tfFxgndl2hREo94tW2i/vhhzqAZtSWGMdj9NJzecU8oIOVC+QOl8wFMlP+Kk=
X-Received: by 2002:a1c:2e48:: with SMTP id u69mr623576wmu.30.1605557137772;
 Mon, 16 Nov 2020 12:05:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwslCHk9/9hFAwka0iKRYGHchn/cR350Kj9Neu4CqPs80+kaKcUHWzIUFVnkHcrAnGRC9zxfw==
X-Received: by 2002:a1c:2e48:: with SMTP id u69mr623560wmu.30.1605557137528;
 Mon, 16 Nov 2020 12:05:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u5sm19537865wro.56.2020.11.16.12.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 12:05:36 -0800 (PST)
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-6-hare@suse.de>
 <07739b7b-2087-0279-8f4b-6c909079cf48@redhat.com>
 <931dd292-e5fb-4956-aaaf-02429a61b730@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/7] scsi: Add mapping for generic SCSI_HOST status to
 sense codes
Message-ID: <10dbdf68-20df-8517-e16b-f6c1baa4c8fc@redhat.com>
Date: Mon, 16 Nov 2020 21:05:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <931dd292-e5fb-4956-aaaf-02429a61b730@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 20:03, Hannes Reinecke wrote:
>>
>>> +        case SCSI_HOST_TARGET_FAILURE:
>>> +            *sense = SENSE_CODE(TARGET_FAILURE);
>>> +            return CHECK_CONDITION;
>>> +        case SCSI_HOST_RESERVATION_ERROR:
>>> +            return RESERVATION_CONFLICT;
>>> +        case SCSI_HOST_ALLOCATION_FAILURE:
>>> +            *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
>>> +            return CHECK_CONDITION;
>>> +        case SCSI_HOST_MEDIUM_ERROR:
>>> +            *sense = SENSE_CODE(READ_ERROR);
>>> +            return CHECK_CONDITION;
>>
>> Can these actually be visible to userspace?  I'd rather avoid having 
>> them in QEMU if possible.
>>
>> Otherwise, the patches are completely sensible.
>>
> And I did it exactly for the opposite purpose: rather than painstakingly 
> figuring out which codes _might_ be returned (and be utterly surprised 
> if we missed some) add an interpretation for every _possible_ code, 
> avoiding nasty surprises.

And that certainly makes sense too.

On the other hand it'd be nice if Linux was clearer about which the 
SCSI_HOST values are part of the userspace API and which are just an 
(ugly) implementation detail.

Paolo


