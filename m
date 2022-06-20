Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B838E55219C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:52:27 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JhS-000572-Rp
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JaY-0007Wg-Ks
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JaV-0006Dy-JY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctj+iTGJbOWSVIP02uFMbtgi4bSPnwLF4wJ7j14nlqE=;
 b=bWTyVCIkdUu9IMjPzHTJ9u3EmPUMQvvMVJBGtTpYs4uC3JAv5ahoOy2LfU5TR5v3LnSQYe
 5wLpXGExIJ3c019qQiOsFDWqFqT6BNhKdfN5qOwjiwoADuDmbcZhEwoikcuXH42l/g8xtK
 8+xVEI5/89lgiS3CHXlFeT01KUgTZwo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-VhXhEWh0PXa8uWV_OjwAcA-1; Mon, 20 Jun 2022 11:45:12 -0400
X-MC-Unique: VhXhEWh0PXa8uWV_OjwAcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b0039c832fbd02so7046098wme.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctj+iTGJbOWSVIP02uFMbtgi4bSPnwLF4wJ7j14nlqE=;
 b=7pVTPUbhE+eNGwRzVDA6nbQkcCutFmzMsakZNFVPhdLkS2tpp28qARe7czjnl7WsDj
 fSc3EV0etOylZyLjCsNfjDz0u25EUYawJkBbn/dDHEaXw/ppLBbsA9ZG9awJuJAASbDX
 kpQLdzJtWztVf0xJvioZz+Yz6GKyq6i82Y/q2D+DpkzlPTS22aECmWP31reXPzQcnfin
 iceEb4+rk39sXOr3CA+A6yoyUVIv35Ierv70QKQ2tS/6IYKAOrlCe07F57f9JK9654mN
 /bIEDkVb85dLhjwiS0UYH7kp1VflBuO6/2iw2OYzB+z/FzoXOiKpibj/6sr5DXa8Ph83
 7pmg==
X-Gm-Message-State: AOAM533bpC48BJntop3473Z/CI4sopGLmWZiI2T1I5D+43H4FjNthNoj
 g1TOSpPcU7q85Bo5kCZ8hdjAunNi+fUJugAjGmXqqLI1EZahcuiUHVHV9wJNbyB+WALCYdwz+M/
 /139i7YkpE1KtibQ=
X-Received: by 2002:a05:600c:1f05:b0:39c:51c6:7c85 with SMTP id
 bd5-20020a05600c1f0500b0039c51c67c85mr36893873wmb.33.1655739910867; 
 Mon, 20 Jun 2022 08:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLIXqEAIIdWA+j/PkywLjgXCI7EyPZnl+kZL3AnhMfE0LqtM+/rVkTVckdDudn7fEIw80BQg==
X-Received: by 2002:a05:600c:1f05:b0:39c:51c6:7c85 with SMTP id
 bd5-20020a05600c1f0500b0039c51c67c85mr36893842wmb.33.1655739910607; 
 Mon, 20 Jun 2022 08:45:10 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b0039c5b9e9142sm15877085wms.17.2022.06.20.08.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:45:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 20/21] migration: remove the QEMUFileOps
 'get_return_path' callback
In-Reply-To: <20220620110205.1357829-21-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:04
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-21-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:45:09 +0200
Message-ID: <871qvj1gqi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the get_return_path logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


