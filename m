Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241C4ADE02
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:11:55 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHT5t-00018I-Dm
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHS5R-0007gM-2o
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nHS5N-0005p5-SM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644332837;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=J2H0r3n4s7LvIe2LzdDZHGmOTV+Jy2p1FhyqlgxwnB21vy2h7ittmWmlme8U0wh/3KLE3S
 5XZWfqPPxD7h17lgZQ4tzzVL4j70AniHr+E5tQAU0/bv6uXnmaIU9YRzH5vaB2JFJk4uON
 zc+VkLwKsXgFp7th+v6T/8jm8Wo8OG0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-OO4cKW-PPq2NfNRLjMmtfw-1; Tue, 08 Feb 2022 10:07:14 -0500
X-MC-Unique: OO4cKW-PPq2NfNRLjMmtfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso1148219wma.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=h2ZnaOY+E6nTP4Shda/9ZIhVLWbWpf1w2qzwpkpF2FLQqn1uJCGSNEggtjOpE1KxFL
 I6bpcpE6+IvGqisYup/KMVcn3OUUNzTQe3e/gC5zwphQz9uzAdXhQIBDqr26+0uG0V2S
 Cd2H4v50zEHu7Cn2BBJwrw+L2R1r7pXfulvd3SXtJOlVcm/+sbE/D7PVNVaiCMyzZa5i
 l5U124b1eaP2eCBh66qGDwm1YwtTuTFcBoN5/JA4zTpjfebj/sg4dGejmGmtBEOHLXRj
 go/XVYoawe0zhjoAymVA8oZ4ZtdbcNsmGWBxYcmNp+AEObaZZYp/Bydat6DzGLmFXU+S
 PW2w==
X-Gm-Message-State: AOAM533QrQfEETGPhHD1wq+gqAQnNiLuXQ1NAC7u9SGbfl33sazEviIF
 rreE3IUpXPyVglXk8DCA9Fx9Jy0YVjV0EROVSu6VDVkLnfB7yjFqKIhR6OYjw4c52OxKuW5Skmm
 xS7r/f8V/BgIfPPg=
X-Received: by 2002:adf:f54d:: with SMTP id j13mr3722696wrp.596.1644332832969; 
 Tue, 08 Feb 2022 07:07:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2UiyJSQeSGcLexVZ3CFBHpaxf/eyRS45/KDjXqpi+ZTlnuHgAwYp1zFFxrynMcAjVoTkJGA==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr3722684wrp.596.1644332832762; 
 Tue, 08 Feb 2022 07:07:12 -0800 (PST)
Received: from localhost ([94.248.65.38])
 by smtp.gmail.com with ESMTPSA id k28sm1996834wms.23.2022.02.08.07.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:07:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for agenda for 2022-02-22
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 08 Feb 2022 16:07:11 +0100
Message-ID: <87bkzh75y8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


