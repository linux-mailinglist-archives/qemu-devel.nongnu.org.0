Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD596E9D85
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:58:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbM8-0000jg-DZ; Thu, 20 Apr 2023 16:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbM6-0000jL-PJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbM5-00072B-Df
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3XzTf68TcbKMqT5C013AewCSLgY1B4PJHAxxIq93WQ=;
 b=PCGn3SIQbsnk6KJkZ7P3pDM8r5Y5V++JWXIvTUHUH4s45l3UAecsbH52Fb5gKvOfrF94tk
 TFLiOX76VdMcinlnjfqonxUh33CYiEi7s9t2uew0QIhbD6DQpsldA8O9FFOF0aEsKu8Ave
 uua77ghZ+a/Bff4vAn3x2rikh9wlIK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-zXHfjH2nN6S46TEJgVosRA-1; Thu, 20 Apr 2023 16:58:10 -0400
X-MC-Unique: zXHfjH2nN6S46TEJgVosRA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f0b0fbd4beso3843405e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024289; x=1684616289;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3XzTf68TcbKMqT5C013AewCSLgY1B4PJHAxxIq93WQ=;
 b=Bb0XLhpUQQcfVqMuR90ld0nVONojhunCbGtu6ZFV+tKUBwaz6VUwU9n/6zdLNsx1ns
 kuvoRGGnGfMiR2TZ4I0PFKC4ajFH9KfJV+1ax8FaF2FWZRBF6sevFxyzMGTzP8gkpgOo
 Xd6SEwJ5fpX9vCWZE1/2Co8LfIXVoXii/AJZOHxfM93oyTVwx11cJfVpM25f1KEwhD4/
 z9bwEczLNIGbS9hwKfXOFYxO+9EY4bUQOXz8PJMqiiUwBAjHj+oZD0Pjyypl1vKLIrK4
 2P5/JIJpoewPo2Il1rM6r0vA0wteqxy+4g5opjUb621Y9IzZwaTbfQGb7IRnxjk2vHKv
 G8qQ==
X-Gm-Message-State: AAQBX9dgPvx0mpsrQx90goSP9TdNVE4/Gwh5S6F66LPO4/u5GYDwjvHr
 AnnGZA5VSptNLOPnPuOGIa1yLXUggsowpBloAlo8G+rnJF3piY61NrN3asrqmvyudSYXDrUvWqC
 cLBMTDtPvOLGLXO8=
X-Received: by 2002:a7b:cb50:0:b0:3f0:683d:224d with SMTP id
 v16-20020a7bcb50000000b003f0683d224dmr197360wmj.9.1682024289708; 
 Thu, 20 Apr 2023 13:58:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZUPwygviWFHIXEl2z5ia2eGqhB61kyc3C1xMTJa+Gf2+iG9372gyWnONtPib/UhE1ht8ZuMQ==
X-Received: by 2002:a7b:cb50:0:b0:3f0:683d:224d with SMTP id
 v16-20020a7bcb50000000b003f0683d224dmr197347wmj.9.1682024289489; 
 Thu, 20 Apr 2023 13:58:09 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm2973836wmj.35.2023.04.20.13.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:58:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John G Johnson
 <john.g.johnson@oracle.com>,  Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 8/9] docs/devel: mention the spacing requirement for QOM
In-Reply-To: <20230420155723.1711048-9-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:22 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-9-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:58:07 +0200
Message-ID: <87ildquv8g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> We have a more complete document on QOM but we should at least mention
> the style requirements in the style guide.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Juan Quintela <quintela@redhat.com>


