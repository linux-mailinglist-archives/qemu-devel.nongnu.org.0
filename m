Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCD349B63
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 22:06:25 +0100 (CET)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPXBP-0007tO-KR
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 17:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPX9Y-0007Fy-N6
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPX9V-0000va-Au
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616706263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLVsAZdzFUVWhos7srlwimEKr8DJyNZi8h21XDPpxpU=;
 b=IoSkP5D9ln0knYqgsLVM5IVuFwBf9oII+Oeeid5J8Bp2Q1qdbuOexCdNFLd+3dm4io/Mxl
 8OZaUTIWEjXjLyll7Y+opdp6rJchb4Jigywg5BNheJ5ClQE8QsI7ObgFY4I39Vq89b0y3M
 OF9j4mZdcNVF8kb/7k9MGhrjlV6SV7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-8IZ49FgCPxKTvb0ZHh7nIw-1; Thu, 25 Mar 2021 17:04:21 -0400
X-MC-Unique: 8IZ49FgCPxKTvb0ZHh7nIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD4A88127C;
 Thu, 25 Mar 2021 21:04:19 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E76BE6E6F5;
 Thu, 25 Mar 2021 21:04:18 +0000 (UTC)
Subject: Re: [PATCH v4 09/19] qapi/expr.py: Check type of 'data' member
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-10-jsnow@redhat.com>
 <87r1k3s41n.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9fd0c665-09e6-7fc6-b6cd-d9af08670d82@redhat.com>
Date: Thu, 25 Mar 2021 17:04:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1k3s41n.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:26 AM, Markus Armbruster wrote:
> Suggest
> 
>      qapi/expr.py: Check type of union and alternate 'data' member
> 
> John Snow <jsnow@redhat.com> writes:
> 
>> We don't actually check, so the user can get some unpleasant stacktraces.
> 
> Let's point to the new tests here.
> 

Well, it'll get merged with the last one to keep make check working, so 
I have to update the commit message anyway.


