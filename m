Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED423F1A1D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:13:41 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhrX-0005Hz-TN
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGhpz-0004Ea-LY
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGhpu-0007Fp-Bu
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629378715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBQjRJsv8W9sofeL0ejylCojka0/ERtaQOElGyril38=;
 b=NKddzxOtxhDu1V1Zivc5P1X1y2KtL3mpn9f52dc2CXKgzyPLJQZjfrSMMfPc+iSx3PZY6n
 MgQmnRTkf+h4I4lBjgqrFDw6/Tiug393dwGK8lDr5loa5txTQsMrzQUVXQNuZASImRtKUd
 y4mMLqiz6uQ+1y6QEcXHpOGSBSGyVR8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-TH7QZOHjPByXXgrIX5uuGQ-1; Thu, 19 Aug 2021 09:11:52 -0400
X-MC-Unique: TH7QZOHjPByXXgrIX5uuGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 z1-20020adfdf810000b0290154f7f8c412so1681659wrl.21
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VBQjRJsv8W9sofeL0ejylCojka0/ERtaQOElGyril38=;
 b=LuaxCBpP7XvHK3RoLd/pOUzfx/mFGRF9GTIpruhY3b5laPupl2axkhr6LBIynOHJjF
 7znXiL1YXSERi8sI2O2Fvj442vVfEAfHQxuKs4/juanY6XKFhanQPe+x2d1JuqFD4xsN
 17cR/Yqx6M6Y1bZNXSEYd9+gIEzZwEFhcUucGb5WwQTQZeG/X+K7dVoHlkU2p917Tx1/
 VAD/kfyUt9vjXjgZfNb8QDRkzcNrObww+gXvNq+RIQ1aWX6pRM9OozU6Ur8rH5Y4T2xA
 fKpkHCWNpvrL1Bqm4ogcEXUGChGNrwQLqa3Hate2xM1hHtcGLuORNdlX8AuEtSj498BO
 kSOA==
X-Gm-Message-State: AOAM532HAc9b244bzWuAzbY6SQm1nZKioIIo0IKQStI3lto2WsIU3z6x
 +q+N5xodEd2FCMrzfVYkDLnWslRUt0DXSVCk6BYmTWixPLtG5qgnt+6MA0Rfl1t7EgbWoye7zNp
 WlXZZYo/rD31sGa8=
X-Received: by 2002:a5d:4bca:: with SMTP id l10mr3748292wrt.187.1629378711549; 
 Thu, 19 Aug 2021 06:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqVFW42sFZYOCm5jRa3pvaW0YlLZDvwSbpNJpNtP7tW4zF4VCm9+/iyKcY0FPxtnkO3un9+g==
X-Received: by 2002:a5d:4bca:: with SMTP id l10mr3748261wrt.187.1629378711359; 
 Thu, 19 Aug 2021 06:11:51 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e3sm2979637wro.15.2021.08.19.06.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 06:11:51 -0700 (PDT)
Subject: Re: [PATCH] block/monitor: Consolidate hmp_handle_error calls to
 reduce redundant code
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210802062507.347555-1-maozhongyi@cmss.chinamobile.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <75176ff3-405e-9d7e-8c9c-9a043e1dbd53@redhat.com>
Date: Thu, 19 Aug 2021 15:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802062507.347555-1-maozhongyi@cmss.chinamobile.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.08.21 08:25, Mao Zhongyi wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> ---
>   block/monitor/block-hmp-cmds.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Thanks, applied to my block-next branch for 6.2:

https://github.com/XanClic/qemu/commits/block-next

Hanna


