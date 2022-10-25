Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0460C89F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGUY-0003zu-L6; Tue, 25 Oct 2022 05:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGUL-0002W6-7s
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGUF-0000ue-RF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666691082;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=K8sv6BsLxDmTacz3/7q337+EIuLc9EYBRgz/pbJyDBY=;
 b=OLPjKiM1de4wqbnlIaRfMk9K82jWxeQoZwdfWVrRoXZDDATOL/h0JznmJN14457eNoM2ii
 9ivZuyTadl5JYxcLCAOXGl9VqSmwDBrU7YCWK0OG7j7U4L3vYDBjDCntyAaeIHcHZXqKQ4
 +/fft4WnC5swx6bcanWJ8DDZ9jldZ5Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-3vyceT42Ov2MjYFgE__7pQ-1; Tue, 25 Oct 2022 05:44:41 -0400
X-MC-Unique: 3vyceT42Ov2MjYFgE__7pQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 3-20020a05600c020300b003c5eefe54adso2268182wmi.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8sv6BsLxDmTacz3/7q337+EIuLc9EYBRgz/pbJyDBY=;
 b=KhNqcSn3zNd9uCpl2/7iSkWCafCcP7wo2aoAFCn9J831fkHv6y2SoZsd90BLtnY+4f
 fKTM2JfHjjdsyoSiSjMhwRZAx5K83Z91+uQazVlNhu4DWMCflqRxgri5bdeHDkPtuRzE
 P9FmMftQHd/FYBPidzpE2RS0Dpan77dPZDkQsL0gglvpoEisbAAHvgrvnQQSC4QyEVlm
 H6BGVfB/9ZRQTUdPhqDpMaCkimJSm7YCXPtjvephUj/WK0xc0j/1oD+5nTjxpg6ZU/Ii
 B7+QdYD27mtgMLx26ZUQvO2h/VCsKX4EXwyOyj2urV+y0Lnc8bwh8lVcx/BnaDLMlhEs
 qVdQ==
X-Gm-Message-State: ACrzQf3deOkYVQysLnJHpCI4C+WHTBG6mwdJVTgeV2T59EBrZY5SycOn
 JI+Vjg/SBSivBvsvPH9uRaRpWwIYjViR8UbAtGL4KpFk7MTMc+FxkzoHgvRjkhdtRLJGRsJHEMd
 ZkI6L2erST6tr/Z4=
X-Received: by 2002:a05:600c:3548:b0:3c6:f7cb:1567 with SMTP id
 i8-20020a05600c354800b003c6f7cb1567mr24911506wmq.161.1666691080061; 
 Tue, 25 Oct 2022 02:44:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7UqdFHG9I/fGkonFzQ2AoI0D0CHafdfc4hQ3ZETR9Eh2fF9Z3JvCrsC7REXQ3FhvdLCdSWFA==
X-Received: by 2002:a05:600c:3548:b0:3c6:f7cb:1567 with SMTP id
 i8-20020a05600c354800b003c6f7cb1567mr24911488wmq.161.1666691079780; 
 Tue, 25 Oct 2022 02:44:39 -0700 (PDT)
Received: from localhost (static-28-206-230-77.ipcom.comunitel.net.
 [77.230.206.28]) by smtp.gmail.com with ESMTPSA id
 i4-20020adfdec4000000b0022e344a63c7sm2059547wrn.92.2022.10.25.02.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:44:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/4] migration/multifd/zero-copy: Create helper
 function for flushing
In-Reply-To: <20221025044730.319941-2-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 25 Oct 2022 01:47:28 -0300")
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-2-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 25 Oct 2022 11:44:37 +0200
Message-ID: <87fsfcdypm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
> Move flushing code from multifd_send_sync_main() to a new helper, and call
> it in multifd_send_sync_main().
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


