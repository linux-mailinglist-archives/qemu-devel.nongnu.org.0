Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C5325946
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 23:11:49 +0100 (CET)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOrM-0006xd-0B
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 17:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOqI-0006Va-2D
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOqE-00009O-F7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614291037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOkqFH4dEnYYP6qw6+PpEGBLFJLOqr+1mu7kr7WfWvc=;
 b=YXpohYt1IOI5DrWCHVK49RiCoqXfi0HryE0jtNjKHIC1hlhp1eIKsMY3flB2gYPJrQeVUP
 81bBYB1lXEp+tBCzZdK5WBI0hfkidD9AWBFMY1Jt+PZ5K3HsgyqZRSYPuV8oL5Q3DkINsg
 lM613DHx5lIFWPFBLJjsAukWOQ7bF0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-f4das7iFMTKQJGtlBfU5-g-1; Thu, 25 Feb 2021 17:10:35 -0500
X-MC-Unique: f4das7iFMTKQJGtlBfU5-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C251193578B;
 Thu, 25 Feb 2021 22:10:34 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 663345D9D2;
 Thu, 25 Feb 2021 22:10:33 +0000 (UTC)
Subject: Re: [PATCH v3 07/16] qapi/expr.py: Add casts in a few select cases
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-8-jsnow@redhat.com>
 <87zgzt1w9w.fsf@dusky.pond.sub.org>
 <9b9b1b1d-1988-2bbd-4f6e-6374ebd3cd88@redhat.com>
 <87czwos64o.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1769a97f-614c-884e-f9c9-aa3e9c9d41e8@redhat.com>
Date: Thu, 25 Feb 2021 17:10:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87czwos64o.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:07 AM, Markus Armbruster wrote:
>> Unfortunately, the "check" in check_exprs falls off almost immediately.
> What do you mean by "falls off"?
> 

mypy loses the constraint in its static analysis. i.e. all of the work 
we do in expr.py is almost entirely opaque to mypy.


