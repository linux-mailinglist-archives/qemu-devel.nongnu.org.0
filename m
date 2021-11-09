Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB144A7D0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:47:27 +0100 (CET)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLqo-0002RL-T3
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLot-0000T5-2e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLop-00085Q-Bo
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qWGcRigulDO6X+C2UhUqs1BTKquJJklJ+i8Y4GYXxdU=;
 b=g61samM6WDSWpATRfvVOUzzvC0rdjO8QXz1i2O6jgNCN2N8b7S8U+mHyp+ARQO+KFUiWPJ
 JmSu4TxrjDeUo6fkpo8Urv9Qh9OZnoCUoH+4fiyx7ypcyv164KjilJ5+YrZNq0OXyS4hGe
 xTCRihKp7VEBxVKPf3wNXilwfpgeAFQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-4Chap8XLN7yY_O8VBYjoBw-1; Tue, 09 Nov 2021 02:45:19 -0500
X-MC-Unique: 4Chap8XLN7yY_O8VBYjoBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so912029wmg.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qWGcRigulDO6X+C2UhUqs1BTKquJJklJ+i8Y4GYXxdU=;
 b=b9hvdgyQdbxSMndHVhqvURadBWtXeB5O27r8zlNBhqI7U15zDybi90CLZ9sSNl7WMR
 hZQxy57J4pyT1kya78tiMPQCRHtMnDc96xGGNzYFPCMgcCI3rtpRrMEG29cAslA1kqg8
 F1tpMBjlaRRhp2RbQjLn6AWWbDy8Bfez1ACACam35RB4IX/ZNlbUSIgdptCwipz24Pmx
 9E5g3bJHvCycD3P/jy21pV2pMPmTNqIG+4SRja5L5vD6oZPlQfnsikvncYXWsQjFxwkr
 VH3tslQObQa0sjdXD5CYG58MKBg9fX0mKVQ7OiJuxtZpXb5h7P4TxTZJKaXB53hnQvsV
 X4EQ==
X-Gm-Message-State: AOAM530YJ1k5MZysk49+AwPGoqwKea34yUP3sP1gsJqx6vEPFonanaz9
 OAyjwfGi8YkVkvWSUBCuIqQ0kGn3CwHnVWadryFdQSDCgel2XRl7iiAVrO7kINz6+q3RzGmUKFw
 uZiHR08+qSjmS73w=
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr6360136wri.355.1636443918796; 
 Mon, 08 Nov 2021 23:45:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB5t3AAml92k0sO3yNHvVDga7eTeoaOsU5f5bnlogc3S4dkbyHgfNZw+Br2swFS5ZN9MskpQ==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr6360099wri.355.1636443918540; 
 Mon, 08 Nov 2021 23:45:18 -0800 (PST)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id r17sm1814845wmq.11.2021.11.08.23.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 23:45:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v7 2/2] Reduce the PVM stop time during Checkpoint
In-Reply-To: <1636427095-11739-3-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Tue, 9 Nov 2021 11:04:55 +0800")
References: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
 <1636427095-11739-3-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 09 Nov 2021 08:45:19 +0100
Message-ID: <877ddhg4c0.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, lukasstraub2@web.de,
 zhang.zhanghailiang@huawei.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When flushing memory from ram cache to ram during every checkpoint
> on secondary VM, we can copy continuous chunks of memory instead of
> 4096 bytes per time to reduce the time of VM stop during checkpoint.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued.


