Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0A63CBAA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 00:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09rt-0004Uc-Ct; Tue, 29 Nov 2022 18:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09rZ-0004Hp-Vx
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09rY-0005hg-I2
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669763878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzMtC09S/pLRAf/+6biCkEJxi+YmQaPyT85KPiw4W1Y=;
 b=ZLCnXVL7pvYD1DfBdW2xAvqcCbcMH/rqhTnddvUyJ96Ptj+LThPqw2AiSNUwkEKWDAMhe9
 n3F/7oMi1AnmTbktUK5/EvNkKbMzLOq6V3WqPv2uj80bUK4pkTxzg2CqQIU7H1loeF8Lq4
 BWicw6IR1mtK8KCAEaSmhzkTWZuvJQU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-541-GZK-ntTfNXGjaCQ_mZJ_kA-1; Tue, 29 Nov 2022 18:17:57 -0500
X-MC-Unique: GZK-ntTfNXGjaCQ_mZJ_kA-1
Received: by mail-qt1-f199.google.com with SMTP id
 y19-20020a05622a121300b003a526e0ff9bso24165941qtx.15
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 15:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fzMtC09S/pLRAf/+6biCkEJxi+YmQaPyT85KPiw4W1Y=;
 b=6KWrMrY0mSRKSKOUkLRLrvQYrcTF41gPTfIbKbEoK33a+ssss0EYNECBsjt1dRdciK
 c6aQpuPzbf8ZvXN//z8TZ1MYB1H4KOa6WJSXJ3OgOfAP0lh/5TMbFCdOsUj//Bvm1KQn
 iFK18o7E4hqIEqJGBe3sJc3gBxdDi1Xw1Iz42/WWi10X/tzcdBO/ndC+5EEkz3OePUZu
 ZTxPEidbfq6OVOfFZ3g9sVzWm7e7OAuSrVUeOUS1nrK9xu5QLHZ9pQ2p8oFplPeBj2ru
 fHqz+ZUpcaIgF48EI6XesM8zB2jVLb1ykRDyzCr2srjU4WY2rP2vaJoUkc82z+qbcnZ5
 xHQg==
X-Gm-Message-State: ANoB5pm1SGr8ZC7TXcBm0b9lSy+RgZTAmPX5StYpuGcvyKHOBocxrD66
 dawTR8RHDN+uHYPUYtjl7tQG03a2q+9t4DXGQw+igxmecbwrKqjxbHI71cz9cjt/7Za6ZA4RPzb
 Xj8suG2VDgvLNew0=
X-Received: by 2002:a0c:e649:0:b0:4bb:6a31:3f0 with SMTP id
 c9-20020a0ce649000000b004bb6a3103f0mr36147017qvn.110.1669763876889; 
 Tue, 29 Nov 2022 15:17:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YQQzlglgZ/dkM9TZOHmXJCYUFSRTVp54a7H4/JiOqWZSY8gCOtbu/V5KByHyoV+3fvPydEQ==
X-Received: by 2002:a0c:e649:0:b0:4bb:6a31:3f0 with SMTP id
 c9-20020a0ce649000000b004bb6a3103f0mr36147006qvn.110.1669763876703; 
 Tue, 29 Nov 2022 15:17:56 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac81197000000b00399ad646794sm9275149qtj.41.2022.11.29.15.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 15:17:56 -0800 (PST)
Date: Tue, 29 Nov 2022 18:17:55 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/11] softmmu/dirtylimit: Add parameter check for hmp
 "set_vcpu_dirty_limit"
Message-ID: <Y4aTI4+f6a+ROwRi@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <56f207f3f962da7d90772cce1e724d50ba415d79.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56f207f3f962da7d90772cce1e724d50ba415d79.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Nov 21, 2022 at 11:26:34AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> dirty_rate paraemter of hmp command "set_vcpu_dirty_limit" is invalid
> if less than 0, so add parameter check for it.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


