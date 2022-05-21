Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F052FA33
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:15:56 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLDH-0002Iy-Dx
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nsLB1-0001X1-Ck
 for qemu-devel@nongnu.org; Sat, 21 May 2022 05:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nsLAy-0000qp-JZ
 for qemu-devel@nongnu.org; Sat, 21 May 2022 05:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653124411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=chRQFAPxY3UOZfcQzjwXpmRa3S+Vgz+XJC7PiFBTcC2NlO5Tajf1VvPqJ1KQvowDDXrdGe
 AU8qTw4NClz/d1tZbtytDVeqr34AOyh4OYKmmJKuDymG3YOesFmYphmixxCdfQfO0esxLR
 BDOodg04Czekb51ziCVMIVWZsswPcnk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-Yx4Njm8wOGuL7r6P1biAQg-1; Sat, 21 May 2022 05:13:30 -0400
X-MC-Unique: Yx4Njm8wOGuL7r6P1biAQg-1
Received: by mail-ej1-f72.google.com with SMTP id
 go17-20020a1709070d9100b006f46e53a2a9so4754484ejc.10
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 02:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OnT9RL0AbLa8Ob9ohPnNK83McoWNln32tPlJ1Uviq2+2uyA9XvfHJyCG+9LgqG1bLt
 857+F4nctKPSVQP/xutUyEIegMS4hthXiBo5/UNiMGAhlsyXeOaLSr7Fzwfn5lyawD1g
 7tn1kyIfuH/fPdh6TmJKxHnROnuW7NCrHJyI2USeOL/6EBfvHRT+U/1DMOsGonuL1TZL
 C5RgH6OtbpVEdoEue0VquUhSPJ025id/xQugC78FckP5j9Gd8JEUCx3qZ8ow5migI+i3
 tPkSON3AMj5LiVDR6Cj6SJPZTpV9IpeQGjnfroWYIE7PTGkV/8b/DPwdhooN20roEO0O
 BPxg==
X-Gm-Message-State: AOAM5322rLMAhhYuVcJe5Zj2/tONRvPW69uqsyuDpIGNMPp/Bb226JIQ
 TU+OvHftiSSXDj6wXcvyB3Q5BB9DsMUR3vBYpe8k0H4D31z4V+I0l+ciqhjIw0Q4vg4M0WyP1SL
 YiLcwjS0mA9ypCeA=
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr11162650ejb.398.1653124408386; 
 Sat, 21 May 2022 02:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTRfxEOkCBXBnWVO5bJjwsKXvTuCdwyGsv5nqfGSfu3jMkPZRd7nhOs8grAPPFdD6+FU4n1Q==
X-Received: by 2002:a17:907:9243:b0:6fe:976a:e117 with SMTP id
 kb3-20020a170907924300b006fe976ae117mr11162635ejb.398.1653124407907; 
 Sat, 21 May 2022 02:13:27 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 zl20-20020a170906991400b006feb479fcb4sm1292634ejb.44.2022.05.21.02.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 02:13:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Cc: richard.henderson@linaro.org, thuth@redhat.com, pbonzini@redhat.com,
 f4bug@amsat.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 yan@daynix.com, viktor.prutyanov@phystech.edu
Subject: Re: [PATCH v2] contrib/elf2dmp: add ELF dump header checking
Date: Sat, 21 May 2022 11:13:24 +0200
Message-Id: <20220521091324.1754612-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520084339.171684-1-viktor.prutyanov@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



