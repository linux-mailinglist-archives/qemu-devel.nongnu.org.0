Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DC3220BC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:20:32 +0100 (CET)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHh1-0003fH-07
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEHfu-00038u-Md
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEHfr-0002h3-W4
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614025158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxU6lE8aetwTygtxby1V4kJylbvZulG6xQfCooLV+Lo=;
 b=MKxiFr8t3ZOYjGQhJ3wpiTsefBroHlozTQtv1ReH/UaYh/Zy03mh/LEhgU43SisyLlM9yX
 vG2AKiugyueO0qqUO/PRXd7K2hAiKn+hot9ethOONvxHJbULd0LGogJqZ6tj0wNW3T4HTl
 P61f8rmJb8zmWhEGbG1tVmhO6AOOtjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-tOpFg9VlPJWrLPVlqYz9wA-1; Mon, 22 Feb 2021 15:19:14 -0500
X-MC-Unique: tOpFg9VlPJWrLPVlqYz9wA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089EC107ACC7;
 Mon, 22 Feb 2021 20:19:13 +0000 (UTC)
Received: from [10.3.113.156] (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4488360C4D;
 Mon, 22 Feb 2021 20:19:12 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] improve do_strtosz precision
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20210211204438.1184395-1-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0aaa18a2-eff8-1a50-209a-c03a425b86e9@redhat.com>
Date: Mon, 22 Feb 2021 14:19:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 2:44 PM, Eric Blake wrote:
> Parsing sizes with only 53 bits of precision is surprising; it's time
> to fix it to use a full 64 bits of precision.
> 
> v1 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01800.html
> 
> Since then:
> - split testsuite improvements from code changes [Vladimir]
> - more tests for more corner cases [Vladimir, Rich, Dan]
> - fix handling of '123-45' when endptr is non-NULL [Vladimir]
> - fix handling of '1.k'
> - actually enable deprecation of '0x1k' [Vladimir]
> - include missing deprecation text for rounded fractions
> - improved commit messages
> 
> I'm still not sure I like patch 4, but it's at least worth considering.

Ping. I've also just realized that this series will fix:
https://bugzilla.redhat.com/show_bug.cgi?id=1909185
"The error message of "qemu-img convert -r" should advertise the correct
maximum number"

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


