Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201A28B845
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 15:51:13 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRyEK-0002jV-Dc
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 09:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRyDF-0001kZ-0o
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRyDD-0000ji-6x
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602510602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVZY04nvOE1qgvoPm3COFlRUQxgDmu2OY51x1jomjxk=;
 b=cNbq4pBwG3JxaERclQVjPWQbgOMwBAThxB298CB0lh1uNO44NDmh/kp6XmdwmdLRExyZlh
 TgJqIrekP9nM0WTx3VKv+Xx3pJ6L0TPZnwwGFb6bOMVUYrmJaJrJb3k3xO++I90DsUZriS
 NHk9Rg7CHsHNMMzpS9yrx2B01vLAcJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-IcgQ_j-nMbChNJ-J1kGs7A-1; Mon, 12 Oct 2020 09:50:00 -0400
X-MC-Unique: IcgQ_j-nMbChNJ-J1kGs7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540D518A8221;
 Mon, 12 Oct 2020 13:49:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C6BF5C22B;
 Mon, 12 Oct 2020 13:49:49 +0000 (UTC)
Subject: Re: [PATCH v7 02/13] qtest: Reintroduce qtest_qmp_receive
To: Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky
 <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201006123904.610658-1-mlevitsk@redhat.com>
 <20201006123904.610658-3-mlevitsk@redhat.com>
 <3dd3b467-6784-470c-cbfb-b7baf611abde@redhat.com>
 <f3098b68-2d6b-6c99-4658-5b3c32227832@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a09865ae-40ec-0fc7-0b95-2f039284d546@redhat.com>
Date: Mon, 12 Oct 2020 15:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f3098b68-2d6b-6c99-4658-5b3c32227832@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2020 15.47, Paolo Bonzini wrote:
> On 12/10/20 13:14, Thomas Huth wrote:
>>> +/**
>>> + * qtest_qmp_receive:
>>> + * @s: #QTestState instance to operate on.
>>> + *
>>> + * Reads a QMP message from QEMU and returns the response.
>>> + * Buffers all the events received meanwhile, until a
>>> + * call to qtest_qmp_eventwait
>>> + */
>>> +QDict *qtest_qmp_receive(QTestState *s);
>> Re-introducing qtest_qmp_receive() with different behavior than before will
>> likely make backports of other later patches a pain, and might also break
>> other patches that use this function but are not merged yet. Could you
>> please use a different name for this function instead? Maye
>> qtest_qmp_receive_buffered() or something like that?
> 
> We chose to use the same name because the new version generally is the
> one you want and, except for the handling of events, is exactly the same
> as before.  In other words, I'm treating the new semantics more as a
> bugfix than a feature.
> 
> The only trap that backports of later patches could fall into is if they
> want to look at events, but it would be caught easily because the test
> would fail.

Ok, thanks for the explanation! ... but I think it might be good to have
this information in the patch description, though.

 Thomas


