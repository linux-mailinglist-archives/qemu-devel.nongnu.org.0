Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E969A799
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 09:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSwXz-00051I-Km; Fri, 17 Feb 2023 03:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSwXt-00050h-6y
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSwXr-0002ey-49
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=A1uAyVKxYcJlGykm/ygSfCKZOCVBHRCZo1zYn6M1WT+e4iLSYQTCb/r+AqUQHTk+W4+umV
 xtviQDIk+gtlSM0vv1rYncQHLwkAruJcRQCLcs3M2VHYSvsw4BYgnHH5eC9f8pu51dVG8/
 itNCwIpEtvqDnhQlyoVX5WeUblDgwDY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-0T1nokirNK6g57_rwYF0iw-1; Fri, 17 Feb 2023 03:56:31 -0500
X-MC-Unique: 0T1nokirNK6g57_rwYF0iw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n38-20020a05600c3ba600b003ddff4b9a40so346934wms.9
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 00:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RMGBlTBDeIoJwZN5MN1JineKmBu00QdpRjE6xB/sSPHlJWWm20xc2mUcllsLE2zoDw
 LPbAMOWkjFTcIGweHgCsqwAor9GISYQw9Ji6FcNxBWydP8gjzm2KzGhrrhbrZ2YNt6mk
 TNEygy4tWW+pBa8zKc0A8awRSL4pCJ3pn7olkLFU8yNU94mZfuaG0//sptGyz4i7hSZ1
 QVlx+frwcbWBJLHMxXDwsI6gBxqm4gcKY6Dc28JTuC8l0C5KUIqnFlihkvoP7f1UlP9X
 FPqfDVeCFiEVlpYCU5XnGKsxND33oSnuKGWj0qCVlzG4Mk3JW6AXwtAESpfa33M+VLkh
 o2KQ==
X-Gm-Message-State: AO0yUKW8WKoA+BYWQQttbk5vGj06s5FmzG+DFtVMGAF5b/2bXr6BjqSD
 hq9k2IMNvSXWYUUap12uOqimI8CbNgSlf5PW1aKYw+wCg6YfDJhMFJ4rsBj+UZY3SgFcHLCLr1d
 Z17R7ywihy5FQlc4=
X-Received: by 2002:a05:600c:130f:b0:3df:ffab:a391 with SMTP id
 j15-20020a05600c130f00b003dfffaba391mr515947wmf.24.1676624190691; 
 Fri, 17 Feb 2023 00:56:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+eQchjEw1pmwJj358k6m0ZqsyQZ8O3/lJ5GvTu3Pbgiz3gL89CZlli9YYoK8PxncX5eF24eg==
X-Received: by 2002:a05:600c:130f:b0:3df:ffab:a391 with SMTP id
 j15-20020a05600c130f00b003dfffaba391mr515939wmf.24.1676624190373; 
 Fri, 17 Feb 2023 00:56:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003dc5b59ed7asm4494206wmb.11.2023.02.17.00.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:56:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Brad Smith <brad@comstyle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] thread-posix: add support for setting threads name on
 OpenBSD
Date: Fri, 17 Feb 2023 09:56:27 +0100
Message-Id: <20230217085627.189033-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


