Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB768F6C0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPozC-0003xp-Ac; Wed, 08 Feb 2023 13:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPoz7-0003xg-6U
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPoz5-0007QV-Eo
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675880154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0bNJhQ1y9K0vM0Iv49PK4LSLFjTYPDnDnJdk02wUgow=;
 b=Xqs3rc7v5s3kBLkHULxBwAW9ydWvi0jFsjT9IkxiBPLr5b1x9Q2FUEQkJd8Jnn+WfakaQI
 zpFMsdRE/1h65Cvzpnnm9awPLI8ORdPa4XvIhb8Eyv4glRAy15XNB+eRGbfvdxRHbhKY3+
 lKNU/OCQF96JlfRl1zUEqdoMP7YbDoI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-nBzFJrDZP6uUowH6-ROCjA-1; Wed, 08 Feb 2023 13:15:52 -0500
X-MC-Unique: nBzFJrDZP6uUowH6-ROCjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so1427053wmq.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bNJhQ1y9K0vM0Iv49PK4LSLFjTYPDnDnJdk02wUgow=;
 b=PT2JDBg2Hdr1WwFhSKKwqk+AYyiZHwZSaZRIX1XVS/Jl3RoeyBYh52l/pVgLTxW2Hp
 xcL2Lb33x2pb0mg+MJyBqRMYI5mYtyWHLuTROOknClgizWMguR7ZPeBOxVbvKGdS8s+U
 JqbeExDH/fJgtOlE94L6JoeSpe0hUzXXf+5vM4OiQxoB8Bhj+IUKlXMyT+D7jgaUnwl5
 qPIpPa/w+sC1KiKpQ2CZPU5tIbXueBCKZu0l9OtOE/iXsfY2k41FYyDu1QFQS8ZsusND
 XCGF60PEEnWLkWSSN2PcxBphdDbDEeOfOTQy9wsb5Drluq5YTi18/c2gNkssH3/lRELF
 JVoA==
X-Gm-Message-State: AO0yUKX7pq90IEwgubQIVi9t77AQLzUu1hdPIp01SVlyY1v6zN5mrk1B
 8XCormjjeoaa1uLGkzEC6mrrm1lCMa7KAKiA6vrKvlB6FbjkHYAPkQCVpQguXRcOY1RJkhw3TXi
 TSPy5VvHGbrRJ7hM=
X-Received: by 2002:a05:600c:164a:b0:3df:deb5:6ff5 with SMTP id
 o10-20020a05600c164a00b003dfdeb56ff5mr7252599wmn.24.1675880151695; 
 Wed, 08 Feb 2023 10:15:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/cOP0pvoyUWDbBl2Le3a9kIM45XU8sZmzj/Uuj4ri/3fCBsWo0XKN2PXA/Zb8ArLmOcdlnsg==
X-Received: by 2002:a05:600c:164a:b0:3df:deb5:6ff5 with SMTP id
 o10-20020a05600c164a00b003dfdeb56ff5mr7252586wmn.24.1675880151472; 
 Wed, 08 Feb 2023 10:15:51 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm2576779wmb.15.2023.02.08.10.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:15:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] multifd: Remove some redundant code
In-Reply-To: <20220127200201.26092-1-lizhang@suse.de> (Li Zhang's message of
 "Thu, 27 Jan 2022 21:02:01 +0100")
References: <20220127200201.26092-1-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 19:15:50 +0100
Message-ID: <87k00shvl5.fsf@secure.mitica>
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

Li Zhang <lizhang@suse.de> wrote:
> Clean up some unnecessary code
>
> Signed-off-by: Li Zhang <lizhang@suse.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


