Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A166F6E9D7D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:54:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbI2-0006FA-Lx; Thu, 20 Apr 2023 16:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbI1-0006En-AX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbHz-000542-Sz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XquwRGhzRg0qs7QyTjUAd1T0tITLZ9T50pfpPcbJCF4=;
 b=dxN+sdmNEUIUdQKkaBi0E4Guxqo69MHEqLWVwzvfGXKug8Dh2EuBEEBiMvDwcAQ0QxPAh8
 qnbdE8+XJxSiEx1tu9hkQy2vutMv/GHSgMHjkyvjQpk14uBPVaFH2jm1tFMIz36JupUavt
 YL+Emfmq6AXlb87o7j+bttViTbgL+G8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-bRY1MaXRNRSVvZL9Ef6b6Q-1; Thu, 20 Apr 2023 16:53:57 -0400
X-MC-Unique: bRY1MaXRNRSVvZL9Ef6b6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f080f53d62so3858605e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024036; x=1684616036;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XquwRGhzRg0qs7QyTjUAd1T0tITLZ9T50pfpPcbJCF4=;
 b=lFGNfujHJnMMR5llQGmP5cowfT7b8tn3DzEl705CDp4yNdBSq1Z564HAp1w45Ige/M
 gH/RHEPEvZtWe20k1KH+nGqU5imaWVyhH0V17SEbHviyKOX27PIPIii14FCXpl3Jr84+
 bc3QwinzL6ztIBg1coeVLUmMAL/5R6lczVx8ziODM36UHqSla2AXw4+I/QqCCsPWtjR8
 isVzRyZWa2g38iIxu9wK2dQKGShfdJEpSklj5FJI7XsgvkXqM47L9EtVX9/l0OEyAC36
 b8c6V+S7MLZck6FAB1tLJVn7veLnG/GIpbDa+wenaS+/jaZXVsdejbcTygb85ZuMOQZW
 oaBg==
X-Gm-Message-State: AAQBX9fkN0/wU00rTjptHTh36RjNzSqpF03TxA0F35eurMQfBFanU38P
 hGMjskcUGcdYaXnySKeZhQR3An8+IQ5enVIIgpC1A5xO0UFmvoFVSvnkJ789NitNYFgzaAxtxn9
 +aO1aj7yv7xtet7A=
X-Received: by 2002:adf:cd85:0:b0:2fb:283a:1754 with SMTP id
 q5-20020adfcd85000000b002fb283a1754mr2618693wrj.32.1682024036279; 
 Thu, 20 Apr 2023 13:53:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZEDfqBcB+nMU2t3tZARW6bOQ1cYHLuk2SWiL7qwvvF7aPYqwbK8y59+mjcVHzG8HyVVcepdQ==
X-Received: by 2002:adf:cd85:0:b0:2fb:283a:1754 with SMTP id
 q5-20020adfcd85000000b002fb283a1754mr2618677wrj.32.1682024035950; 
 Thu, 20 Apr 2023 13:53:55 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfd0d2000000b002fae7408544sm2776793wrh.108.2023.04.20.13.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:53:51 -0700 (PDT)
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
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/9] docs/devel/kconfig.rst: Fix incorrect markup
In-Reply-To: <20230420155723.1711048-2-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:15 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-2-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:53:49 +0200
Message-ID: <87zg72uvfm.fsf@secure.mitica>
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
> From: Peter Maydell <peter.maydell@linaro.org>
>
> In rST markup syntax, the inline markup (*italics*, **bold** and
> ``monospaced``) must be separated from the surrending text by
> non-word characters, otherwise it is not interpreted as markup.
> To force interpretation as markup in the middle of a word,
> you need to use a backslash-escaped space (which will not
> appear as a space in the output).
>
> Fix a missing backslash-space in this file, which meant that the ``
> after "select" was output literally and the monospacing was
> incorrectly extended all the way to the end of the next monospaced
> word.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20230411105424.3994585-1-peter.maydell@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


