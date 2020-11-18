Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AA2B8148
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:57:46 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPq5-0003YX-BR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfPp4-00037i-Hb
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfPp1-0007PC-Ap
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0U5ObEt3QYQJpPGvxEEquARrLPOnTPq/NplEgkgfQ0=;
 b=HPSGLbrj+05CwDTqPJxxX4gkIGYdlHkoPr4gmvaMB9DAgpfZ9/PZZkMnSOf1RqcKMKUmOV
 os0x0FUUGscgexJfg7pmKorZblW4kNcrkl1rBXp14NNaiuhNu6S9MWi1MdQD/TF4LyYhdh
 GDU/ZCw5Fz7nMvglACkYLvlohXlcm30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-4mjYTXZxOiKfyYdJiQB7tw-1; Wed, 18 Nov 2020 10:56:34 -0500
X-MC-Unique: 4mjYTXZxOiKfyYdJiQB7tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF7318C89CD;
 Wed, 18 Nov 2020 15:56:33 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D845D9CA;
 Wed, 18 Nov 2020 15:56:29 +0000 (UTC)
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
To: Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net> <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local> <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
 <20201118115612.GD229461@redhat.com> <87blfukbzd.fsf@dusky.pond.sub.org>
 <20201118154507.GI1509407@habkost.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c411d2ac-fafe-872b-cc34-9c7b5901120d@redhat.com>
Date: Wed, 18 Nov 2020 09:56:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118154507.GI1509407@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:45 AM, Eduardo Habkost wrote:
> On Wed, Nov 18, 2020 at 02:53:26PM +0100, Markus Armbruster wrote:
> [...]
>> Another way to skin this cat:
>>
>>       {"available": {"kvm": { extra properties... },
>>                      "tcg": ...,
>>                      "xen": ...},
>>        "active": "kvm"}
> 
> How would this structure be represented in the QAPI schema?
> 
> In other words, how do I say "Dict[str, AccelInfo]" in QAPIese?

{'type':'AvailAccel', 'data': {
  '*kvm': 'KvmExtraProps',
  '*tcg': 'TcgExtraProps',
  '*xen': 'XenExtraProps',
  '*hax': 'HaxExtraProps' } }
{'command':'query-accel', 'returns': {
   'available': 'AvailAccel', 'active': 'strOrEnum' } }

where adding a new accelerator then adds a new optional member to
AvailAccel as well as possibly a new enum member if 'active' is driving
by an enum instead of 'str'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


