Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA228EDCB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 09:33:43 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSxld-0004m8-Th
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 03:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSxk9-00044V-Hx
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 03:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSxk6-0001Pn-5N
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 03:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602747125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SojCI0RrSVv80sIUoClhlPxvf0gxV6yuPNkldvfEXDM=;
 b=J3Lv9ag10ZSV/v6TSGsQ5ZFvFJ1Eb5TGOlxJWdRuwFGyUML4up+cyGxdaj6JvYFh5ETrxP
 zL1LORaWy6LuR++x+fmPX6vFcx/CIZx45EARitNTnBOw3dVruMi/NZkmvAfel2PJHMdhpb
 OI4ui90UiJwwqRno8xzfJyv3oCNlgaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-4N-q3HpLMNmAQP1_mQUclw-1; Thu, 15 Oct 2020 03:32:00 -0400
X-MC-Unique: 4N-q3HpLMNmAQP1_mQUclw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16B80802B6F;
 Thu, 15 Oct 2020 07:31:59 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8710D76673;
 Thu, 15 Oct 2020 07:31:57 +0000 (UTC)
Subject: Re: network buffering in fault tolerance
To: Shivam Mehra <mshivam2196@gmail.com>, qemu-devel@nongnu.org,
 qemu-discuss@nongnu.org, "Zhang, Chen" <chen.zhang@intel.com>
References: <CANp2S64q_MEp6MWuYvt2iNFq4kKZQ+3xOhVhbQ0AqD9CrQqcSQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3e025aed-c3c3-88f9-8ef9-d18cde6e9568@redhat.com>
Date: Thu, 15 Oct 2020 15:31:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANp2S64q_MEp6MWuYvt2iNFq4kKZQ+3xOhVhbQ0AqD9CrQqcSQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/30 下午1:12, Shivam Mehra wrote:
>
> I came across this documentation with source code for providing 
> network buffering to applications 
> https://www.nfradead.org/~tgr/libnl/doc/api/route_2qdisc_2plug_8c_source.html 
> <https://www.infradead.org/~tgr/libnl/doc/api/route_2qdisc_2plug_8c_source.html>. 
> This network-buffering helps output-commit problem when providing 
> fault tolerance to virtual machines. The output is buffered until an 
> acknowledgement arrives from the backup VM and then released to the 
> external world. So that backup and primary VMs seem consistent 
> externally. Initially developed for XEN VMM to provide fault tolerance 
> to VMs and I think it's now available for |QEMU| too.
>
> Where does the script reside which does network-buffering for 
> checkpoints? and what are the commands to make this happen?
>
> I want to do this network-buffering for packets originating from an 
> application. Is it possible to do it in the same way as above? Does it 
> do any damage to the host kernel? Can I get  a simple working example 
> for this?
>

Hi Shivam:

I haven't gone through the qdisc you mentioned, but it depends on a 
specific host network setup to work if I understand correctly.

Qemu support a native HA (COLO) which has a buffer filter.

Cc Chen for more information.

Thanks


