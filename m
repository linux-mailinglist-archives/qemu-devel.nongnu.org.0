Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FA2EF10F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:07:05 +0100 (CET)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpbk-0007vm-LC
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxpb2-0007VV-0z
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxpb0-0005yd-Hy
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610103977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnCeEX35iyCKCYSzfftzQSuEQtvqG52msp/fIrlk5Ds=;
 b=V1ZHjRYbDnEOZN+J3Z6BtLy2FY4yuZiX2ananvyer6iNi1UP3ookzGh8sN3likLk8p+6KX
 hhyHp4CpjRayI21xGkcGWujsaITbLTAyFTUi9MraZQrBeVbD3iAr+KJgvDNNYkGruBWo/K
 Fgu/UxskUbgPEl7TgOHR7jvh/74fdtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-DLdjdHdUO8iWEnDnSlDeLQ-1; Fri, 08 Jan 2021 06:06:16 -0500
X-MC-Unique: DLdjdHdUO8iWEnDnSlDeLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4870802ED6;
 Fri,  8 Jan 2021 11:06:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-213.ams2.redhat.com [10.36.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9C7A7771D;
 Fri,  8 Jan 2021 11:06:02 +0000 (UTC)
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210107171719.477856-1-pbonzini@redhat.com>
 <20210107182812.GI1029501@redhat.com>
 <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
 <CABgObfZt-8gG3c4WTZqd0Ls0VEe43MFc_mFuykoZvDP2ZGu0gA@mail.gmail.com>
 <20210108101645.GE1082385@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29312927-eb21-dab0-cea2-c2c9139a3e0c@redhat.com>
Date: Fri, 8 Jan 2021 12:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108101645.GE1082385@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2021 11.16, Daniel P. Berrangé wrote:

> IOW, despite travis giving us non-x86 builders, it is doomed to be
> unusuable, unless we can convince them to give us a *massively*
> larger free credit allowance on the qemu account. 
I think convincing them to do this will be very hard. I've tried to apply to 
the free OSS credits for my account, and in the mail that I've got back 
after a couple of weeks, they wrote that "Project must not be sponsored by a 
commercial company or organization (monetary or with employees paid to work 
on the project)" to qualify for the free credits. That doesn't sound like 
they'll accept QEMU, I think.

  Thomas


