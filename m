Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955B2DE9AC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:19:43 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLHy-0003IX-54
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLGD-0002s7-S9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:17:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLGA-0002lh-2G
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608319069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wH0oeL7JRfdSrhhbs3Xop6CKuHZrRzCrzrxIP+2gZh4=;
 b=i3HWJrF7OB0rvsbpyNXrAgCInjQUC89q5kPOuIl3CGcx5B1BnqCTFFCp5S8qleMoZwAYyF
 ZQ/D8PXuS2wAdgrOSs+Mh2oOYtvRx+DuhdylB//Qm4rjEy49iVrWpIDCw1TCIDiJT+TtAy
 eAqx+HU5iuyBGlaqAgRZaIZcCvjud0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-MK1_BgljOIKCM2CZLdbY8Q-1; Fri, 18 Dec 2020 14:17:47 -0500
X-MC-Unique: MK1_BgljOIKCM2CZLdbY8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6698F802B45
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 19:17:46 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9A7E2BFEA;
 Fri, 18 Dec 2020 19:17:41 +0000 (UTC)
Subject: Re: [PATCH 08/12] qapi/schema: make QAPISourceInfo mandatory
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-9-jsnow@redhat.com>
 <875z52rr3h.fsf@dusky.pond.sub.org>
 <60c5ae45-c1c4-8bac-9617-5366e49dac7e@redhat.com>
 <87pn38lv1d.fsf@dusky.pond.sub.org>
 <e9f43898-1c0b-54e3-59a7-d9064c2d86ea@redhat.com>
 <87mtybd6ut.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e99196f0-8ea7-6627-04c3-e07754321e01@redhat.com>
Date: Fri, 18 Dec 2020 14:17:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87mtybd6ut.fsf@dusky.pond.sub.org>
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:24 AM, Markus Armbruster wrote:
>> I could conceivably use source line information and stuff, to be
>> needlessly fancy about it. Nah. I just think singleton patterns are kind
>> of weird to implement in Python, so I didn't.
> Stupidest singleton that could possibly work: in __init__,
> self.singleton = ...
> 
> 

Yeah, you can make a class variable that has a builtin singleton, then 
make the class method return that class variable.

Feels fancier than my laziness permits. I just put it back to using one 
copy per definition.


