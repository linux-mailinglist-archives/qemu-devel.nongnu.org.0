Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399865FE417
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:17:33 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj5a7-0002Qt-N6
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj5Y1-0000wo-En
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj5Xy-0000tP-K0
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665695717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SegXCIIR0nrxlk7jBGJksHZY/0bUNX+fAzXCxOcJYwDwdxKkn50WNfHxdJRn7g9UkJ57Xm
 V2WplrwA5FqBin5dJAtipGYtHmuC0nSmAt4RfuDTAjp1rCY+Xk8+6o3LaZ7ipE3JtpP+QD
 G7/DOhmHw5vCXKa1lCWtswj2n9UQZrg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-B19ASrcCOTGlBrF7B9PrBw-1; Thu, 13 Oct 2022 17:15:16 -0400
X-MC-Unique: B19ASrcCOTGlBrF7B9PrBw-1
Received: by mail-ed1-f70.google.com with SMTP id
 c17-20020a05640227d100b0045c91f982a1so2289685ede.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=XIn5az9YCdap9s86SrNajPc9H6U0tCP+Eq5LnpB8xZr9w9bioUwlfMf75pOLXTqH/x
 j9cGQSw9zdqWddIuCrgQbQCeiJ3dO/RkrWYn2ebSSLSoivFWWH6Y2HLJgaSveg530AS7
 3yRe8UHlbTGGSzzrY1lnKIkAj/HOn7BUleJmIwrKepgueBRyy6M+YwEb4Uo447qJgkWM
 rhzyIkj5lnSAn41CP2wkf0pNM+T1m2D1rjKAOUmMz0/yX5maox+2KrudaaNxKgAG1fj4
 5NEKXau3HFTg4skv8y+s6CTsDNM8Eci/vXy8+ohSpfDVLkGYALWcPdg3czsNtKTALq/p
 PSQg==
X-Gm-Message-State: ACrzQf1AqaWpIPAeoCanCWAHvT19Ie+313e2WEbxFnc1GqLxdc0zw/Zq
 1f6UdlyStj4kcOblKCjXsuMjRupE78gUitPBG1OcBv0GEukr3kieqIJ2lFJtt+I3bk+X6WU2ABh
 utGkgymwlRTeKRig=
X-Received: by 2002:a05:6402:3890:b0:45c:2b5:b622 with SMTP id
 fd16-20020a056402389000b0045c02b5b622mr1464471edb.69.1665695715461; 
 Thu, 13 Oct 2022 14:15:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jqbKR9Dv9HJt6zOqt8lzI1Vmi0yFQITYPVoyDzSCJdjmMG/yCSGagVMfXy7LOPjeAuGwr+w==
X-Received: by 2002:a05:6402:3890:b0:45c:2b5:b622 with SMTP id
 fd16-20020a056402389000b0045c02b5b622mr1464454edb.69.1665695715219; 
 Thu, 13 Oct 2022 14:15:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a50ab19000000b004587f9d3ce8sm469527edc.56.2022.10.13.14.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:15:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH v2 0/9] target/i386: Use atomic operations for pte updates
Date: Thu, 13 Oct 2022 23:15:11 +0200
Message-Id: <20221013211511.657425-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo


