Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAF2DC272
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:47:04 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpY51-0002Iy-Cn
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpY2h-0000gS-WC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpY2g-0001OJ-G2
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608129877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hjm/kA/sFZcms4+61kGKjeRy8wiBSmgtr1BZ+9qS3V8=;
 b=KaZ79IbiVzZyerW+SXlProhvJOpweO4nXuV6GLdVChFoQEuVjMGcitzqkYSAynZzoK7DTs
 tRbadECob3HoGqnbPecMkeDxdY1hhlGnVlxSUM3hlamtHwPV/v+gE3ef573/5cSxa9YF6W
 o/v+RAye0rcTfC/42h0Quk8vLXgOwAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-3ata3QCUNpCqV3tKm6cMuw-1; Wed, 16 Dec 2020 09:44:35 -0500
X-MC-Unique: 3ata3QCUNpCqV3tKm6cMuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF04107AD4B;
 Wed, 16 Dec 2020 14:44:33 +0000 (UTC)
Received: from [10.36.115.49] (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E9960CCC;
 Wed, 16 Dec 2020 14:44:32 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] target/s390x: Improve carry computation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214221356.68039-1-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a7c017b1-bfcf-9780-2cee-8096ec0fef23@redhat.com>
Date: Wed, 16 Dec 2020 15:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214221356.68039-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.12.20 23:13, Richard Henderson wrote:
> While testing the float128_muladd changes for s390x host,
> emulating under x86_64 of course, I noticed that the code
> we generate for strings of ALCGR and SLBGR is pretty awful.
> 
> I realized that we were missing a trick: the output cc is
> based only on the output (result and carry) and so we don't
> need to save the inputs.  And once we do that, we can use
> the output carry as a direct input to the next insn.
> 

LGTM, @Conny, can you pick these?

-- 
Thanks,

David / dhildenb


