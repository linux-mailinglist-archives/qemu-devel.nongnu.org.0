Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA823276079
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 20:49:56 +0200 (CEST)
Received: from localhost ([::1]:37906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL9pz-0007is-Uy
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 14:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL9e7-0004Mg-L6
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL9e3-0001ei-TB
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600886253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vr04Iiy+6jfqkb+t/0hZBq9Wgre6EKlK6aGEfogwLY=;
 b=PqUWybSmCy4uzyoy1gxf/nIg8mleWgIYnqQ/46FylNoMxUA6qrJ8YF+QYTzTFuRrOK0o4J
 3zFsBRORpT0VnOxpSEREzjtvaOGe/rMlaYjHSayIbOdfUzvvgRn6GEV1Aajgnfyl66k0E6
 lp9LvJxie4blWm/l2E3sbV66EFm9VGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-bYJDjwzyPaKNT26xg9aN1Q-1; Wed, 23 Sep 2020 14:37:30 -0400
X-MC-Unique: bYJDjwzyPaKNT26xg9aN1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51246800135;
 Wed, 23 Sep 2020 18:37:29 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73611702E7;
 Wed, 23 Sep 2020 18:37:28 +0000 (UTC)
Subject: Re: [PATCH v2 28/38] qapi/gen.py: update write() to be more idiomatic
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-29-jsnow@redhat.com>
 <20200923152624.GO3312949@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <c0b8ed9e-c66a-a6fa-43e1-c3c61581d928@redhat.com>
Date: Wed, 23 Sep 2020 14:37:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923152624.GO3312949@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 11:26 AM, Eduardo Habkost wrote:
> On Tue, Sep 22, 2020 at 05:00:51PM -0400, John Snow wrote:
>> Make the file handling here just a tiny bit more idiomatic.
>> (I realize this is heavily subjective.)
>>
>> Use exist_ok=True for os.makedirs and remove the exception,
>> use fdopen() to wrap the file descriptor in a File-like object,
>> and use a context manager for managing the file pointer.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> I really miss a comment below explaining why we use
> open(os.open(pathname, ...), ...) instead of open(pathname, ...).
> 

Not known to me. It was introduced in 907b846653 as part of an effort to 
reduce rebuild times. Maybe this avoids a modification time change if 
the file already exists?

Markus?


