Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E183323C0E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:47:28 +0100 (CET)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtZf-0002B8-IP
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEtXk-0001FJ-4G
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEtXg-0001CY-SK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614170722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwO2bzh6m82m7cREw1IniHe0/Crv1VRy6IyRMfDGsDM=;
 b=grdP2xdTa8h39HshDJGAQJ25GnlW0Uf2xoG2x0R/HBMrO8f9UJQQq4uL/nf+RO0jXKzzoK
 tXlaeG8DB70uwpDkRUBdD5d6vuVEq89zkAzAa3BBSXk+OoIYrHzYJiQOUVzey4wk7jXrF8
 4A5Wbr/a+U0cfmBELqvi/zoz5t2CVZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-CtK4KAZ-MASM72fWOXedPA-1; Wed, 24 Feb 2021 07:45:18 -0500
X-MC-Unique: CtK4KAZ-MASM72fWOXedPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA44801965;
 Wed, 24 Feb 2021 12:45:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-142.ams2.redhat.com [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDB56100239A;
 Wed, 24 Feb 2021 12:45:10 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] fix build failures from incorrectly skipped
 container build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210216132954.295906-1-berrange@redhat.com>
 <YDY/GK9TWgCEnqOD@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6d57c632-b8e2-5853-5cae-97fec79e7a32@redhat.com>
Date: Wed, 24 Feb 2021 13:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDY/GK9TWgCEnqOD@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2021 12.57, Daniel P. Berrangé wrote:
> ping - can we get this series merged so we reduce the chances of
> stale container images for people working across multiple branches

It's in already:

  https://gitlab.com/qemu-project/qemu/-/commit/c31fa24e9690ef62b

You should also have gotten the PULL mail on CC: ? Did it get lost?

  Thomas


