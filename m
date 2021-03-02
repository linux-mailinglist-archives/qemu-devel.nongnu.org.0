Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3632AB03
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:06:11 +0100 (CET)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHBHV-0001Ct-Se
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHBFa-0000cY-DV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHBFW-0001a8-Ha
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614715445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlTrMdAMe4qjxypncbMkcnLLBKQg4JgEwe2Z+fA16kM=;
 b=Qb5S5fsP7I4gF1WCwjPtvHPziGnj6pERgLwXntenBQyNRC6gViQLQEnhcbJYGWOkxcoNQ0
 APrQcNSSJRqVnHSswYFX9uJ4cO6ViffCES8e0rWu9o4nauKpJ2EeifKpfEoONzE+QdIRB8
 DMTw/u/Djqw0aadaLDrrjEsF/BUpzqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-Jaw3Zk6GNXGAa57jVoTU2A-1; Tue, 02 Mar 2021 15:03:59 -0500
X-MC-Unique: Jaw3Zk6GNXGAa57jVoTU2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086661E59C;
 Tue,  2 Mar 2021 20:03:57 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE36910023BF;
 Tue,  2 Mar 2021 20:03:55 +0000 (UTC)
Subject: Re: [PATCH v2 12/31] qapi/qom: Add ObjectOptions for can-*
To: Kevin Wolf <kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-13-kwolf@redhat.com>
 <0250da61-515d-cd41-d680-25431da87373@redhat.com>
 <20210302183200.GI5527@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <49de7436-7488-7756-819f-4f941cf79d33@redhat.com>
Date: Tue, 2 Mar 2021 14:03:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302183200.GI5527@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:32 PM, Kevin Wolf wrote:
> Am 26.02.2021 um 20:42 hat Eric Blake geschrieben:
>> On 2/24/21 7:52 AM, Kevin Wolf wrote:
>>> This adds a QAPI schema for the properties of the can-* objects.
>>>
>>> can-bus doesn't have any properties, so it only needs to be added to the
>>> ObjectType enum without adding a new branch to ObjectOptions.
>>
>> I somewhat prefer
>>
>> 'can-bus': {},
>>
>> to make it explicit that we thought about it, but since we allow
>> defaulted union branches, your approach works too.
> 
> The QAPI generator disagrees:
> 
> ../qapi/qom.json: In union 'ObjectOptions':
> ../qapi/qom.json:492: 'data' member 'can-bus' misses key 'type'
> 
> It seems we can't use inline definitions of struct types because we
> already use that for the extended description of branch types. And
> adding a whole named struct without content is probably a bit too much?

Oh, maybe I'm remembering an experiment I did with a patch to add that
once, but it never went anywhere, since in the meantime we added the
'any enum not listed is acceptable as adding no additional members'.  So
my preference stems from (faulty?) memory on my part, and your patch is
fine as is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


