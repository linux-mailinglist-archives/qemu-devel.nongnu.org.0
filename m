Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CE340BC1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:26:27 +0100 (CET)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwPi-0006Fa-RH
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwFS-0005iK-N9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwFM-0002XW-U1
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616087741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O+oL5TFWvt7IS362aK+kloqDIgv6JOCohI9GoiqvUSE=;
 b=ES/cTynaOAAUYo7ns2pkW5Tjj28Pq3ebqPI2FkIi6QP2iF7pJy3o9+BjjIa6qay7gjyWLu
 cYRfB+8egBsCB+jmSADST0c0tXX+Qh3UChosINjAt4HzD+sk8CSoOF0cJWBEroSuNw+OmT
 CYmU3W28qfTtHy0rOCrwjUFASGmO6xI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-GAUHs1q9OaGkxZ2nTXFsIw-1; Thu, 18 Mar 2021 13:15:40 -0400
X-MC-Unique: GAUHs1q9OaGkxZ2nTXFsIw-1
Received: by mail-wm1-f70.google.com with SMTP id k132so2039348wma.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=O+oL5TFWvt7IS362aK+kloqDIgv6JOCohI9GoiqvUSE=;
 b=XDf0stLo3IHEwQRY3LeEmB49JGEIsT9/NOF6SjJBIoG0JWR68O4edMi3CtbL71xQwt
 ZYQ4LcMnjjgyYJ45n+0i92hEgArJ7g5Di+3edQnf2QWm5SgOipomIL1n5y4js17gv6fY
 LSuWZ/lwD94sjx5vy/dGBKohj0hS63U/o15pZrkqKoP+o7grMtq5eR6IOTZcNtHtNSkp
 nnPyiguPDlYUkSm5Q6kSa0WutYZ36aUH+jKzSKfBK9d68IaLM3wxj9/AV4lfuNBjJx7c
 kzol0n6+4N+0TJy98ufHuquQRLkWeOt8CdKnCloHNCjxVW8k31rwBUr1pnNU5pWRWeR5
 kYUg==
X-Gm-Message-State: AOAM5303THJ7lULer0s7hhEnEzbb9SiuCyenNhwc7mzBMxz0qG0SmVXL
 xvQyh9peo9out3xyI7xf58xTHkQEn+vPtkZKsWPD/JkjQFgiLm+wFjzasa5kbYHRBsg16UpluMU
 ja1LGemn91f8v+uo=
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr283778wrn.255.1616087739107; 
 Thu, 18 Mar 2021 10:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlfXUcoqhS/qx3AKtIjubIxc7f9pdpcF4d96Fn4eELqR6kI7I9KUvbtN5aIhs+RRejUAsi+A==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr283757wrn.255.1616087738828; 
 Thu, 18 Mar 2021 10:15:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm3589609wru.64.2021.03.18.10.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:15:38 -0700 (PDT)
To: qemu-devel <qemu-devel@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [not a patch] sorry folks, this is a super important test
Message-ID: <c8151f46-8e6e-8775-10b0-cf6f8072b972@redhat.com>
Date: Thu, 18 Mar 2021 18:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, PDS_TONAME_EQ_TOLOCAL_VSHORT=0.999,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

test test test!


