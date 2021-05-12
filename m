Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6837D3AB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:54:58 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgu0X-0003xy-VK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgtzY-0003F3-Ct
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgtzV-0006D9-GA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620845631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QQMakYFA9H/ykPjLWVWc6bt6aKfVMcvd9UvOq0MtNE=;
 b=cWLLNo1fWouzA1IKRcocaO1Z7eSBFUmJEbUqT1JFYc5+5my8ejjVeD1IUS/wwDaVcnX/pa
 ELhIRqL7VjHuMRcpdLT6PVflEdP5+8jRsXTHEJNjhRdjN0eNL+kIM6xEAFKGCqaZGPN/uP
 8afkUQwP4vYITvGKtOhdFbv743DWJIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-AFBkiS3yMSKGRnlSVnyM-g-1; Wed, 12 May 2021 14:53:46 -0400
X-MC-Unique: AFBkiS3yMSKGRnlSVnyM-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98A641922961;
 Wed, 12 May 2021 18:53:45 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE77360657;
 Wed, 12 May 2021 18:53:41 +0000 (UTC)
Subject: Re: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
To: Stefan Hajnoczi <stefanha@gmail.com>, marcandre.lureau@redhat.com
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-3-marcandre.lureau@redhat.com>
 <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <41ed2922-84f2-7d27-5fc3-39f0f180a706@redhat.com>
Date: Wed, 12 May 2021 14:53:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 12:39 PM, Stefan Hajnoczi wrote:
> On Thu, Apr 29, 2021 at 05:40:25PM +0400, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Move the generating function to the QAPISchemaIfCond class.
> 
> I'm not familiar enough with the QAPI code generator to know whether
> schema.py is supposed to generate C code directly. Otherwise this
> refactoring makes sense.
> 

It's not supposed to, necessarily, but schema.py *does* already have 
some "built-in" ties to the C language -- in particular its use of 
POINTER_SUFFIX and c_name. It isn't split ultra-cleanly.

Ideally, and I am neither asking for nor requiring this, I would like to 
see code generator backends factored neatly such that the C generative 
code is all in one place, or at least outside of the abstract QAPI 
internals.

(Maybe gen.py can be split into gen.py and c_gen.py, and the C-specific 
bits for gen_if et al can go into c_gen.py.)

Since you are working towards a Rust backend, I assume that the 
C-specific portions of this code don't remain in schema.py for too long? 
I can't imagine them being here helps you with your Rust generator, but 
I could be wrong.

--js


