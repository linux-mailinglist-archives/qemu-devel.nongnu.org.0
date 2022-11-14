Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8528628E25
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinJ-0007Ri-Kl; Mon, 14 Nov 2022 18:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif7-0002B8-Nm
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oub57-0005xp-Ct
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2ZpUDuYJ/L4e1j+qY7D2l85d8vr7hHS+OWDSmn5LGbk=;
 b=AWSdiFyMxKn6eU/4c0abM+sdJpOWtFQfMX/XFFszw8DWVi+HxSZWSTmNB60BARmWlpOpYJ
 0R8YCEfdg6eNHYVV3AlqhMPOmdc0dBRHrj1UC6Ei3I2I/+Mkg2JfHhoZMs/F5D4X2Zpo21
 4FqBhDi+lLSO1Sr5Le5U6fl6ZmDc7/4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-SjoQrZugO5eMiQLNrRPafA-1; Mon, 14 Nov 2022 10:09:02 -0500
X-MC-Unique: SjoQrZugO5eMiQLNrRPafA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so2102289wra.17
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZpUDuYJ/L4e1j+qY7D2l85d8vr7hHS+OWDSmn5LGbk=;
 b=ntTmBmPklrWRQGe9EGJrlUhco4bG7cVOlNYsu3J/3oeVwxlBZqlU/sKPcIozqDJAyK
 7Mca+qXQMtKhBt3A8qSIl0O+yc1h+yy0cGSVlORPf3wJoorK9tL7Vea4GB+S5Ld4AiLw
 3g/8NWbd4GRsn/c0oC2MugEgzbgoxtCB8nN87pw7TTkzphILvKdHN2OZU5Um6yVJN13K
 BmSvTn11mvSkZig4Te1unRdoXeJtL6QT+3WiD2jxpfpXVjiWR9lBoQKSMRU93vG4DrrI
 FWrANq2pRR5Xhra/2qGvXs5HzQxm5LeU3gUsu7bcIYGC96ZKRYd26FY+Ztf2jb575R75
 sSeQ==
X-Gm-Message-State: ANoB5pkUxX6HyrkIwKqN9av/dFnJKltgz8NyDe+qg7hb5JbUSkYWO1GX
 g0drdgSNgwzzQzlzIam/lCIhxNARl24XuhuwcvP6DYESBcq63STy5VYjssg3JUFllQB0LeMyxu6
 fNmLJ0ysYcu2PQWE=
X-Received: by 2002:a5d:4c44:0:b0:236:c45d:e268 with SMTP id
 n4-20020a5d4c44000000b00236c45de268mr8160822wrt.74.1668438541730; 
 Mon, 14 Nov 2022 07:09:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JKyBnykj9t2z0ailC8XcVSKHooOvL8Hjke1DLBXBPS4Or+6WWLxUGWvZhU4+NerGLwx4ZcQ==
X-Received: by 2002:a5d:4c44:0:b0:236:c45d:e268 with SMTP id
 n4-20020a5d4c44000000b00236c45de268mr8160801wrt.74.1668438541545; 
 Mon, 14 Nov 2022 07:09:01 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b00236545edc91sm9942056wra.76.2022.11.14.07.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:09:01 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 04/15] migration: Trivial cleanup save_page_header()
 on same block check
In-Reply-To: <20221011215559.602584-5-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:48 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:08:59 +0100
Message-ID: <871qq5bmk4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
> to be clearer.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


