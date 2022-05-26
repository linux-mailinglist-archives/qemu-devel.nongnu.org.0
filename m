Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02192534AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 09:11:22 +0200 (CEST)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu7eS-0005Yq-KF
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 03:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nu7Zb-0004Eb-NF
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nu7ZX-0003Wp-F3
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653548773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NMBt43MH6+X3fS/UuVRbpkDgNghsZXodff+vZMfwhoZ7qpV+PQ7UWgqUIT+QVfh1Zdz6id
 ev8AMSogo/ACElkRHZ3l+rD1S/hJnqiLUbyrT01cGjq+rbrwfLuN9TNEF34Nb+Na/aDlGr
 4NVEyYmBsxj086IKXSQVvzs97o0gkbQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-Zrd3HvTGNSml-CtgJ62rzg-1; Thu, 26 May 2022 03:06:12 -0400
X-MC-Unique: Zrd3HvTGNSml-CtgJ62rzg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so475067edb.20
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 00:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=xYM0tJd4Ci34wFJyVeNasIHXx3mlydG3/uhu2pe/EBochSVJm2jBxd5iJ/TfK3X9YW
 h9pgaGWe4ThA5hG/ljLH6ZDoI6ARrLXyPofSqBbYGwoTHJxzhxdVN6Pi3oWdNmbmQlR7
 NVqctKDc+RuloPpw5CkxszYQ8HTMn8Sd+TF/uArl/VRQBTQmf8Q3/JLBngPfEyHYa6F4
 8D1vzr2trOsHMyLB4W3/hB5AeJwUtI1NQDB5zvgKzxSVfWfpPFZPjOOv1+Zv4Oj/SKYq
 80+aFqe5sBAOus45lesE0pBMAmHWTnT2+DY4eRAHp9yoVvpTH3X6sADvXT6ZfCMDfII2
 2sKQ==
X-Gm-Message-State: AOAM531iUoULpiC+UwDjEjeKNuakCekLY+FTJfAR4v3npAwFKw1b11GS
 ecq+zXd2F7PlaKa7fX7jTJ4JRlS0gekFA7V04QlcbiRQWt7qXX/OmigPaEIJ0PZs/6zWcPR1vP2
 WqbLot90cvO3Swoc=
X-Received: by 2002:a17:907:168e:b0:6fe:b705:7e65 with SMTP id
 hc14-20020a170907168e00b006feb7057e65mr25334784ejc.490.1653548771251; 
 Thu, 26 May 2022 00:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxEc7F1NV52HMZjAfvAYWOwD5Z8eHRjcrcAvmYg4rnuzi99SvZHav31DVQy+b/8KD3mOqcaA==
X-Received: by 2002:a17:907:168e:b0:6fe:b705:7e65 with SMTP id
 hc14-20020a170907168e00b006feb7057e65mr25334761ejc.490.1653548770992; 
 Thu, 26 May 2022 00:06:10 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a50c191000000b0042617ba63c2sm385010edf.76.2022.05.26.00.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 00:06:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Michael Jothen <sjothen@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net
Subject: Re: [PATCH] target/i386/tcg: Fix masking of real-mode addresses with
 A20 bit
Date: Thu, 26 May 2022 09:06:08 +0200
Message-Id: <20220526070608.309971-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <Yo5MUMSz80jXtvt9@air-old.local>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



