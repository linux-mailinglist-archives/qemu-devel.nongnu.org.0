Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65DF1E08CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 10:27:52 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jd8Sd-0004G2-Pd
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 04:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jd8RX-0003m6-Vm
 for qemu-devel@nongnu.org; Mon, 25 May 2020 04:26:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34870
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jd8RX-0003Lb-CK
 for qemu-devel@nongnu.org; Mon, 25 May 2020 04:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590395202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haNq+RVDQiQnyc08H09JN3GW8h/Jvcqdv1yL9jdaBJY=;
 b=L51KkbyFMoZnh9VWcYGgicvtFJgypZnlbhb9oEyYTp6R+Bnfqua4cAigQVFzYyI8DkPRUC
 SHG1uoDnGxYB2Onzcyr3TK/in14I+DxTNk81zTT9wjb/pbWYCa16uleBRmEVyGDGP68Gr8
 mfIk/QUgFDnh57bXODo6Mg5tRBkJv34=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-QdQVn3tAOWC7-wD9cedsIQ-1; Mon, 25 May 2020 04:26:37 -0400
X-MC-Unique: QdQVn3tAOWC7-wD9cedsIQ-1
Received: by mail-ej1-f69.google.com with SMTP id nw19so6184104ejb.10
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 01:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=haNq+RVDQiQnyc08H09JN3GW8h/Jvcqdv1yL9jdaBJY=;
 b=jf3hQ93pNwT7jLNYRRz3tj18+gvqskWJ/bGGDe5PiKq1byL/Wv63+YQfk912kj3Qyi
 bQcycXmz8lsIPC4kpepeTsgxIAPtc2xEQ9insZHgJmENlIqR9xF2rxigw703tUhx293H
 jjgZAZdOjiJ8vlURtCh2JHnpRolQl3xUfzA+zN3DACYDXC0oRKKWcoIhyropyR6u1jiT
 g3peIdQjkN57WSxo+aM62dnmzY+74XEM475e14qnFLWWSEUMW+LbL8yUriXiL+SUL0IM
 BB3SpFAKJpB1V0rU4WjSNzFAnMaD1ZhLio5z/9IMFnqEQjydgKhVs28wkACJtjMPNVLr
 kYig==
X-Gm-Message-State: AOAM532ISrMuci0697eW8eY6X/D1COd1Vfr+U6ETQSxhkxp5TXTTJktV
 suc03LScbXwOYGN6BkzPNOD6EPHugyOJXcE3vEIcVDgsjrl2Fyo13Vx/AoAx2h+lr8qTkQxpxjJ
 Xeo/J6gx7PklFl4Q=
X-Received: by 2002:a50:c906:: with SMTP id o6mr10789526edh.95.1590395196674; 
 Mon, 25 May 2020 01:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+vtK0NG4i8AYUANQB83dr1UZWPy1HktiSYGRNaIoyVtEm4qTiDEiakIhJIWTgfdvm9NedFA==
X-Received: by 2002:a50:c906:: with SMTP id o6mr10789505edh.95.1590395196313; 
 Mon, 25 May 2020 01:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8?
 ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
 by smtp.gmail.com with ESMTPSA id be12sm14953533edb.11.2020.05.25.01.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 01:26:35 -0700 (PDT)
Subject: Re: [PATCH 50/55] s390x/event-facility: Simplify creation of SCLP
 event devices
To: Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <5c6028bd-0bab-6c78-90fe-f00e23ab71b9@redhat.com>
 <03AEEA41-0543-4097-8FFB-9E41038F31EE@redhat.com>
 <87k110fqgl.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c4c75af-a02b-e86f-23b3-a047809988bb@redhat.com>
Date: Mon, 25 May 2020 10:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k110fqgl.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 02:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/20 09:01, Markus Armbruster wrote:
>> Just remembered that we fail creating the machine and therefore abort. So not necessary :)
> True.
> 
> But let's review briefly what happens when a realize method fails.
> 
> In theory, realize fails cleanly, i.e. doing nothing.  Another attempt
> could be made then.
> 
> In practice, realize failure is always followed by destruction, unless
> preempted by outright exit(1).
> 
> Destroying a device must also destroy its components.
> 
> Paolo, is destroying a realized device okay, or does it have to be
> unrealized first?  I can't see automatic unrealize on destruction...

It cannot happen, because a device must be unparented before it's
destroyed and unparenting takes care of unrealizing the device.  So the
stageobject lifetime should always proceed in this order:

   created
   created, with parent
   created, with parent, with bus (if applicable)
   realizing
   realized
   unrealizing
   unrealized
   unrealized, without parent, with bus (if applicable)
   unrealized, without parent, without bus
   finalizing (without references)
   finalized
   freed

Where the second and third would be fixed by moving /machine/unattached
from device_set_realized to qdev_realize.

Paolo


