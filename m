Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD839F66D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:23:13 +0200 (CEST)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqalF-0001YG-2r
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqaeN-0003mP-8i
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqaeJ-00069P-0B
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vI/3V+jbV6BXZLc+rxYfIf3+kt/ewtzArEqftKOQA4=;
 b=WWlx4iFehxCi4m+NGST23R+A6EhpvIjd7RZ6jCzwPh9vaxhMp+a1+q5H0e4FCyGscPREW3
 Syx71ScSfTEXqk9VHdgNwS3a/YYAgAXeAklB2qjflobYv0bgo0K+EUiNslpR0W7G7oKliF
 5A5co4mrWZXv6zesE922Wit/km1tf68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-rxz3j6k9P5W8GgNryQtFdA-1; Tue, 08 Jun 2021 08:15:58 -0400
X-MC-Unique: rxz3j6k9P5W8GgNryQtFdA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so9380915wrs.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8vI/3V+jbV6BXZLc+rxYfIf3+kt/ewtzArEqftKOQA4=;
 b=l3A679DFjgLjAFl3aXtzLzGVnmLb0nVas2pKEgCOcqEXQkerdufD4uHjrEiNfDxJKe
 NHGhfnP1rXx4g8mlCfV1T/7y3k4uFkpKQXqPRn9saVkhQ5bp+N029blwZO8tWZ1HDe+/
 3TEtcZSkL6vwrb9RZd6uPLWa0nj2h8Eutyp/8yHGxPKvxiGgLNmkVp92d1onJyNtCksh
 Iu2+gHbRBAA8CowpHDG2cOWANtyTTKD9wZb2vvzsG7bJWscoMKem+eDkeF3oqZxm8jVy
 M7w2m2VRaEPWCmiPqmioI+kRb8IqlsL644oZSdRvPPpvQ2jZkqUvh0eZxWs7rLKF5x5N
 +M9A==
X-Gm-Message-State: AOAM5315X/5r2Wd2L7MgHhzzSsnGCurUf6maDuypebNal2WurHmQJGAY
 bAItrqsUX82+H4YOciBpt0QIM8ZSvkLWW8liMUu3nCvXBfjfLRSsD2FcbQPeplOUE9QXJ3iy52V
 6/wgWqRtOHy7ZixAYtdLo/d1T+/k+quODS1Tc6hthcyXqG9RgfFkB6/w4+TIG9Xhi
X-Received: by 2002:a5d:4692:: with SMTP id u18mr21821619wrq.318.1623154556519; 
 Tue, 08 Jun 2021 05:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXGrFgldsqxkLwDGXYUIxrqpqoqyJ36QSbvtfmPiCMoYrA/fQ4lpEW7g8PK48B9gKmX2h70g==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr21821604wrq.318.1623154556339; 
 Tue, 08 Jun 2021 05:15:56 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l31sm2707720wms.16.2021.06.08.05.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:15:56 -0700 (PDT)
Subject: Re: [PATCH 15/26] meson: sort header tests
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-16-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f90587ed-cbf8-9cd8-18ec-cb6722ed33fb@redhat.com>
Date: Tue, 8 Jun 2021 14:15:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-16-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 1:22 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


