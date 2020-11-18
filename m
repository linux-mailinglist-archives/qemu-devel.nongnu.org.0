Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DE2B751E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 04:58:18 +0100 (CET)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfEbo-0003z0-QN
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 22:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfEaE-0003Xd-Qy
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 22:56:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfEaC-000887-Bl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 22:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605671794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9je8/YZ7yojYHTdZJUm5YbbbigzEjrhmSjSwD1K6c/0=;
 b=BHN0hEyCqef7JLl3BBXcXusVcIGR7YHMFK3DfSuOHMqRqwojfA3mnZ/0rh+//9YOp/EgmF
 y+MyuAEzBNSjYpgpFZqLao1XtHz7v8TrybZlHNBwlV/gzKAw+xP1X3OkteiP81kzY4ZmEq
 Qbxsfxx6DE1OslvFYhKftYNIEXASpxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-5Of_BQycOOWHMT44_Tca7A-1; Tue, 17 Nov 2020 22:56:31 -0500
X-MC-Unique: 5Of_BQycOOWHMT44_Tca7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811AC1084C88;
 Wed, 18 Nov 2020 03:56:30 +0000 (UTC)
Received: from [10.72.13.172] (ovpn-13-172.pek2.redhat.com [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70B7719746;
 Wed, 18 Nov 2020 03:56:28 +0000 (UTC)
Subject: Re: [PATCH v2] net/e1000e_core: adjust count if RDH exceeds RDT in
 e1000e_ring_advance()
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
References: <20201113103113.223239-1-mcascell@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
Date: Wed, 18 Nov 2020 11:56:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113103113.223239-1-mcascell@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: gaoning.pgn@antgroup.com, 330cjfdn@gmail.com, dmitry.fleytman@gmail.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/13 下午6:31, Mauro Matteo Cascella wrote:
> The e1000e_write_packet_to_guest() function iterates over a set of
> receive descriptors by advancing rx descriptor head register (RDH) from
> its initial value to rx descriptor tail register (RDT). The check in
> e1000e_ring_empty() is responsible for detecting whether RDH has reached
> RDT, terminating the loop if that's the case. Additional checks have
> been added in the past to deal with bogus values submitted by the guest
> to prevent possible infinite loop. This is done by "wrapping around" RDH
> at some point and detecting whether it assumes the original value during
> the loop.
>
> However, when e1000e is configured to use the packet split feature, RDH is
> incremented by two instead of one, as the packet split descriptors are
> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
> guest may set RDT to an odd value and transmit only null RX descriptors.
> This corner case would prevent RDH from ever matching RDT, leading to an
> infinite loop. This patch adds a check in e1000e_ring_advance() to make sure
> RDH does not exceed RDT in a single incremental step, adjusting the count
> value accordingly.


Can this patch solve this issue in another way?

https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/

Thanks


