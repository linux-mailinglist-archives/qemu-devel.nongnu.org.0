Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CA4432AD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:28:26 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwe9-0006t1-9N
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwbv-0004DW-HQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwbu-0002Tc-46
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IDezkPMpO8WvNXnSWn+/RVlskolktFY4fSsyMlzqiY0=;
 b=bmWqNdrAIEvx+UwOUOpPdyP7HuxPVHIelqQUaLamOk2VwVj+QePg+lS/lVuCPLpOL6ySF+
 dJmtQPUcJ3rZchhVM2EWU/aIuIfZWgaClu+u2jqkDKVeAbyGXJ4IHzwOsuInKmtK+ZVyE0
 ryugkAAzZ1yl6s4g73WBzZF7grI5pKg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-MJ4sIXDcMLKZe28SeLxCDQ-1; Tue, 02 Nov 2021 12:26:04 -0400
X-MC-Unique: MJ4sIXDcMLKZe28SeLxCDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so966202wrh.14
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=IDezkPMpO8WvNXnSWn+/RVlskolktFY4fSsyMlzqiY0=;
 b=cjLhitetJ6MhOm+2qSYOu4eNx13d52KblLvu6TOB1E4RmYKTSxe7IqNVDB4p8utnEW
 B9p5aHDfl07MBTf3SW7iY50LtFqB54wyi0n57IlI0cooW3OtXPucGsWgv3orI3HGKRK8
 bhhVlDBjfHnlk2vhLgxMoeawwmbwAHG/oIXbP4ZZcUsgHuzbIvuriUWf2j7e4Vl0A/6J
 zEclA7AofDjGrf+gaIEFLI24ORKDkdbQPWjrYETuUB+fkuC/qPSXkzLDkBdQ1fDoSTJI
 4fg39QJ6cFkfe1ewknQYJS7WQzIBxCkdiyNK5TP6b/A4QDV3b8SE0VEyJmSxOvT1PwLr
 mtQw==
X-Gm-Message-State: AOAM530nO3UcbutBTLpW9p3yxuY/9+dM/OO8kRtZhb3rcdYcOPdv84z+
 7KS4MLvthBrdVvnfeHROsHhI9fUfK4FPlZDmar+4xdDHp73WHh5lIGYbd2+vJrpPC+xcsEQbgNh
 kRb4yhuGXyBuUiLc=
X-Received: by 2002:a1c:a711:: with SMTP id q17mr8292583wme.158.1635870363128; 
 Tue, 02 Nov 2021 09:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzniwZJu295CGVFEqZRJzCJ6ic1xB8/cQGcwm4Tu9KfeVTI7TtwkbFILSp7Wzik0Z0u+fD0kw==
X-Received: by 2002:a1c:a711:: with SMTP id q17mr8292560wme.158.1635870362942; 
 Tue, 02 Nov 2021 09:26:02 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id l4sm10565025wrv.94.2021.11.02.09.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:26:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH] colo: Don't dump colo cache if dump-guest-core=off
In-Reply-To: <20210704181444.59396f6b@gecko.fritz.box> (Lukas Straub's message
 of "Sun, 4 Jul 2021 18:14:44 +0200")
References: <20210704181444.59396f6b@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:26:01 +0100
Message-ID: <878ry6h6cm.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel <qemu-devel@nongnu.org>, "Rao,
 Lei" <lei.rao@intel.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> wrote:
> One might set dump-guest-core=off to make coredumps smaller and
> still allow to debug many qemu bugs. Extend this option to the colo
> cache.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


