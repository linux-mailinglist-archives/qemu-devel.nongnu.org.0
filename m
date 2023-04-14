Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515466E2298
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:49:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHrt-0000ga-PS; Fri, 14 Apr 2023 07:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnHqi-0007vq-24
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnHqG-0002dO-MR
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681472627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xXRWZ1AApT4UKl/jaUTvbG/yTDHn8c+jQ4ho7mqFIpU=;
 b=erNyuBjCWGzkKGE7MHv9bB39UB0O6c5pKnxdhWPwpiyfW+PJcuD15WBzwpjlH8s9kt1aAK
 eJISQmxN9Eon73MRC5nQ4xRenIh4hFmu1j99QL0D0jcWMufu6DtJz0Tq96qQNLb/3kXNTj
 XVW07BRmq9aR2zIm2uOWR2+HzvDViHE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-0OLWR2IxP_efwopkYfHIFg-1; Fri, 14 Apr 2023 07:43:46 -0400
X-MC-Unique: 0OLWR2IxP_efwopkYfHIFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g23-20020adfa497000000b002f420263923so2163373wrb.21
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472625; x=1684064625;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXRWZ1AApT4UKl/jaUTvbG/yTDHn8c+jQ4ho7mqFIpU=;
 b=lJZdl2SblgQs7QAv4p0ipMXMV5PuLexNSPelsTkmmc2R2jSkQ0TLgqLhwScN64gjm2
 +orMWdmA8tOfQjmFUOZ8qzfLP7WGX8/Y1d5lc8US2l8J1qcWSSQ5K++k4aL3V1KMbaDc
 l1Zd7lYomZfHxgZf3ezEpuDjNBdC2QpE3lFP1G5pFzXWd620PNl+UrA/uzqo07sNVlfx
 cQeulsNyPzO4KUIg4tNzPIUZE/yPTGQEoi7mCmBTFqk68Vo2gVZOV5LMPl7QvNp3A2bq
 NMrDt6TkUAZvx938rwYXcmifMCWZjF7VMhIy9kCmJev3mFbx0FnxFiv5VIl3NmbUAPMi
 C0Zg==
X-Gm-Message-State: AAQBX9d2nEKy7YOr8puy8piq9onE73UfTdoXtzKbaoqNiuKPHfzKURwq
 +hbPhXWHsPENxkRMLk7/DToBGJZ8Kk6HGiQyO8sRScjftg+byErx02ZCRBvfxeQCC0quywdEvTw
 35N2dH0iXW5cn6t8=
X-Received: by 2002:adf:fe06:0:b0:2f6:de1f:acb6 with SMTP id
 n6-20020adffe06000000b002f6de1facb6mr2085174wrr.34.1681472625418; 
 Fri, 14 Apr 2023 04:43:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zf3sNtodo4A4Ofgjo6uOZ8+OYRaE5C9a6d0r9XbbzhKCHPzSmMVk5DhvmWBpCmO1BUfdz7ag==
X-Received: by 2002:adf:fe06:0:b0:2f6:de1f:acb6 with SMTP id
 n6-20020adffe06000000b002f6de1facb6mr2085162wrr.34.1681472625086; 
 Fri, 14 Apr 2023 04:43:45 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003ef4cd057f5sm7972872wmq.4.2023.04.14.04.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:43:44 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2] test: Fix test-crypto-secret when compiling without
 keyring support
In-Reply-To: <849e915d-8628-9bd1-1b6b-9861027fcd3a@redhat.com> (Thomas Huth's
 message of "Tue, 11 Apr 2023 12:16:26 +0200")
References: <20230411095156.6500-1-quintela@redhat.com>
 <849e915d-8628-9bd1-1b6b-9861027fcd3a@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 14 Apr 2023 13:43:43 +0200
Message-ID: <878reug040.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thomas Huth <thuth@redhat.com> wrote:
>> -#endif /* CONFIG_KEYUTILS */
>> +#endif /* CONFIG_SECRET_KEYRING */
>
> Nit: The comment after the "#endif" should mention both switches now,
> like the one earlier in the patch.

You are right.

Sent next version with it included.

Later, Juan.


