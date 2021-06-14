Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171493A6E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:01:25 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrpq-0001Fo-SW
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsrnB-0007Nq-6d
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsrn9-0000Sf-IH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623697115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgsgITJ2FDnxJMUfC5CNvti1i/dOG1OAwpipUT260ZA=;
 b=IuNkn2ynPuIUMqaFskSHkJ9KIdrUNEZ391syhaECdumI3VAstp9s7obWOsZltJ8hn+hxBg
 wHvdyd9DiCqrmAIb8kytoSL/hqlk9PtPgm6uumtu4yXvGVX8lKN1+M/b2mR7pLeGnGMv2f
 f4htnv/hYykp8R7udmzJnKc0lCadC6g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ID18FfGDNimSWTnipnRN7A-1; Mon, 14 Jun 2021 14:58:31 -0400
X-MC-Unique: ID18FfGDNimSWTnipnRN7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso7419091wrh.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgsgITJ2FDnxJMUfC5CNvti1i/dOG1OAwpipUT260ZA=;
 b=n7aTUrvAXW8a5oggFildAa6FHXKllyQus1oYmiKrSc+CxTCqlZ3mTwyaz5ZMgZ5w5j
 3D26uMpN8GHpOsau90jISciN+1PlLkafCKe8xRfFAqLV0AwFp4CHHZylWtdWSZzzRj+8
 szbXc/L+Fit3izV45gphZgqm9XJ/sLPBzZM3/h5MKK1W0/kfnsi7DxF0ID9q1SAbjNXv
 sBNbGoiXlQnEuo3UIDqjK8qc+pADJvPbwqubkbRsQ3bRzE2a3LzAd2rdw8xiZi3EOX4p
 Bhe0z7j8686ALtkks9Q2xgR9DFhMpA6ubKCUHEvUdTC5ebb3r9uddM5F+MjbS2Q9QX4A
 hclQ==
X-Gm-Message-State: AOAM530uWrmb9EmAdht4zs9cLliqRlEaJxbJ9MY6E0p3aaLHY6i1xxYu
 s4elzP8Q8pMDKQeNzalvT5mw/0KRuuW3PWqU8MS7P+cu1AkOP8hS+gRfcZbQvsLjc5suU7tDbdC
 92fW1kmdM9jYtg9U=
X-Received: by 2002:adf:f54a:: with SMTP id j10mr19810798wrp.383.1623697110466; 
 Mon, 14 Jun 2021 11:58:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc6YLxS/6Z0X6wlbAqjhxjWfh6HAVT6NrIpeeMZB/EAcWSxC/rdtfCWZ3QgG6/PgP+jSr7FA==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr19810782wrp.383.1623697110227; 
 Mon, 14 Jun 2021 11:58:30 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm17523542wrm.15.2021.06.14.11.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:58:29 -0700 (PDT)
Subject: Re: [PATCH] net: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210614183849.20622-1-email@aabouzied.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35dd9f29-0cd4-f418-2e40-ea784ede05f3@redhat.com>
Date: Mon, 14 Jun 2021 20:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614183849.20622-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:38 PM, Ahmed Abouzied wrote:
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations in the net subsystem.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>  hw/net/can/ctu_can_fd_frame.h |  180 ++---
>  hw/net/can/ctu_can_fd_regs.h  | 1260 ++++++++++++++++-----------------
>  hw/net/e1000_regs.h           |   30 +-
>  hw/net/mcf_fec.c              |    8 +-
>  hw/net/ne2000.c               |  138 ++--
>  hw/net/pcnet.c                |  136 ++--
>  hw/net/pcnet.h                |    4 +-
>  net/tap-linux.h               |   10 +-
>  8 files changed, 883 insertions(+), 883 deletions(-)

Looking at this change with 'git show --ignore-all-space'
I see no difference, thus:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


