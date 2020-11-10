Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80A2ACAA9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:48:51 +0100 (CET)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcImA-0007jH-Vo
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kcIlF-0007HR-GB
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:47:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kcIlC-0002fH-VL
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604972869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hTijRk0QJ/B1x1ov9DJX1mMg1wMjVYtAJqZqQS40x8U=;
 b=O/g3JJ7Uo3hNqAHciwnVIwQEiisXrc5LWpxCioLZUNf+LVOKZzVw5LKqmIhQ5jFANBL6Kr
 JLcgFBWf+e6oujM+jpuaw6yEiwjQSJnX8sdgB89sjyZThXHSBwawlj4MfIyiNFWcV4mJKc
 JO7X65vvmINiOa+C8xzZpWOjydBvClU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-5W7b6jcCPVubq3Vs-iHjQg-1; Mon, 09 Nov 2020 20:47:47 -0500
X-MC-Unique: 5W7b6jcCPVubq3Vs-iHjQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC69100670C
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 01:47:46 +0000 (UTC)
Received: from [10.10.113.61] (ovpn-113-61.rdu2.redhat.com [10.10.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F6A10023A5;
 Tue, 10 Nov 2020 01:47:46 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Subject: QMP and the 'id' parameter
Message-ID: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
Date: Mon, 9 Nov 2020 20:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:43:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QMP specification states:

 > NOTE: Some errors can occur before the Server is able to read the "id"
 > member, in these cases the "id" member will not be part of the error
 > response, even if provided by the client.

I am assuming this case ONLY occurs for Parse errors:

{'class': 'GenericError', 'desc': 'JSON parse error, expecting value'}

And I am assuming, in the context of a client that /always/ sets an 'id' 
for its execute statements, that this means that any error response we 
receive without an 'id' field *must* be associated with the 
most-recently-sent command.

Correct?

--js


