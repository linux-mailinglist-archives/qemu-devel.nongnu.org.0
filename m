Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A46628E6B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouikx-0005Kp-7q; Mon, 14 Nov 2022 18:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifF-0001zn-Aj
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oua2n-0003Lg-5O
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668434556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vx7J/4xybNOAy2gIGkSR5labcCV82MEmyphcdSRGW5Q=;
 b=SN5qmTy3Uh+WGcvTPOktcZklRtt1V8uaJswi/aYa5GPPk90L7MIkZmPo5v0wNnTvLZfOn4
 x/Wb9t4HjzhhBuVS5Hh+2PSz1wLUCiOjGPipOwDsl+WHqr/vFe1gv330RBzHvxd7vqXqcq
 Z4RH1S50qkAzLPWoz76+0+yNhut9npY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-GMQxU4CaMwusrAi3TULf0g-1; Mon, 14 Nov 2022 09:02:34 -0500
X-MC-Unique: GMQxU4CaMwusrAi3TULf0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo6282515wmb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vx7J/4xybNOAy2gIGkSR5labcCV82MEmyphcdSRGW5Q=;
 b=RQDT2Rn5pLTZ9iLHaGJL0nPM7VkzyjH9+sTs0qK1EXOnQcELCLQns8sKIzP4x62y+d
 rKM5VeIrEAyVcAiF3FOSlglxlAbM8Z2Ix4OcVR4NHgV2v4GwyZKP++cMHurBlF3zeQKm
 gk6uJVOhjsC2rVg1UXmxqgpqtcIRmB2LeyNYsJ/PtvQLvQ1Uz0Rpf4Kmuk33nu7PDArG
 2gqXPtmp6/H53372/eJW1Kta46r+1eJ8HDeoFhUUN8ukCXTe83pj2F5RRUf/dQKPdH93
 bV26Ncje47GVFgQqo85sh6104B4jd5vETK0hzm6/Wi1tBx6SNmi2WG1q6RdGcepkIK48
 oubA==
X-Gm-Message-State: ANoB5pkI1nDH5W/eTjGpDO48JjHvZTfS/4Cj1sQByBDCEO20AWQtnkX9
 O1fOyIelwV1AkQEFrUT3u5NaeYvWMI2B5g88fkYsBq3Sl2Eoo0XvbWjBPJ9wmHBpMXb1dCDT/ja
 RcivfqZyYycjjcN4=
X-Received: by 2002:a05:6000:1f98:b0:236:a920:73e8 with SMTP id
 bw24-20020a0560001f9800b00236a92073e8mr7722204wrb.5.1668434553171; 
 Mon, 14 Nov 2022 06:02:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6w5MY74D9rbcGkFhu22a3tFH/RzpBSf+1PW41RK53f8Nx6fvQ6/RMhio++duG3mvCWLENBlw==
X-Received: by 2002:a05:6000:1f98:b0:236:a920:73e8 with SMTP id
 bw24-20020a0560001f9800b00236a92073e8mr7722164wrb.5.1668434552863; 
 Mon, 14 Nov 2022 06:02:32 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 n9-20020a7bcbc9000000b003b47ff307e1sm12353193wmi.31.2022.11.14.06.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 06:02:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/5] migration: Fix possible infinite loop of ram
 save process
In-Reply-To: <20221004182430.97638-2-peterx@redhat.com> (Peter Xu's message of
 "Tue, 4 Oct 2022 14:24:26 -0400")
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 15:02:30 +0100
Message-ID: <87zgctbpmx.fsf@secure.mitica>
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
> When starting ram saving procedure (especially at the completion phase),
> always set last_seen_block to non-NULL to make sure we can always correctly
> detect the case where "we've migrated all the dirty pages".
>
> Then we'll guarantee both last_seen_block and pss.block will be valid
> always before the loop starts.
>
> See the comment in the code for some details.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


