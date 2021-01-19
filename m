Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411222FB577
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:50:06 +0100 (CET)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oaL-0007RX-Aw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1oTl-0002B7-Fu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1oTj-0000bZ-4j
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611052993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ejABtPcK2ce1JLKj2keIAx0URn0jRcZSJfnMp8Mx+hw=;
 b=Dr3QDSspW3GRkwOVAsFKowLqc2H4PvXIq4ImD17PBwqQ4Ps10eEJq7hgQZXb1+xJXA/ZYE
 0jXi/qB0s63j5G6hgoWMPSVu9sH+pcfUGAvNQp7YhhO01p8E936FWZX6mmC095sFI6dvpx
 4zPZ8WI4Tw2JR8P/RtCofwRK0FduWJU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-y4km6WZgM8GGYs1zOeIoAA-1; Tue, 19 Jan 2021 05:43:10 -0500
X-MC-Unique: y4km6WZgM8GGYs1zOeIoAA-1
Received: by mail-wr1-f70.google.com with SMTP id v7so9639186wra.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ejABtPcK2ce1JLKj2keIAx0URn0jRcZSJfnMp8Mx+hw=;
 b=D3rqhqw5Y2LtxgON75hus6s/r/yhF5JIt2/rD2pQJ5KqwkLfykegq8LRjti4dKcSFB
 Ui3MzXs+bH7bXgAylesbX2Em+DZJOgrnnO/wr67jdqhL93834nJ5vPndDFg5CtRhOeDx
 5EbTZGiKAhIUhkZt/dvAM5e2hEYiZLRrJ1IJ3BTg6/ugKD+U+9PBoPDdRZLRC1GwLXY8
 E1e/iKWSCEYQiYaOwpeWpuDiGP7SAlN4uoY284QT9dVKEK7KZM46E3ds2A5DIHOVaD8Z
 o/gU0NZcufS94R6RPrmWgjXAC1q7LA0sfP3FHOtiJA59E4RgMP0uUCcSH6xTRuXkFzt5
 eKCA==
X-Gm-Message-State: AOAM531kenYquqs+SffR8jl6Fao/HYtmc3IDpXKBZ2RRxroKpB9k8quz
 ebgXn+NZVAhqedCv47xRZfX8BH/P/aFJhjFQZXubS8dp+cdNmWlzZlqJX8lMM1Eo72dkUiMxTQ9
 1gXn2prAFLE3ODk4=
X-Received: by 2002:a7b:c395:: with SMTP id s21mr3414051wmj.97.1611052989565; 
 Tue, 19 Jan 2021 02:43:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRSpFnUeorOiH6yOSoccnil8DY5cnJ3RUNROrq+yPbS2cOC7+YEJD6FVLENxt95Yzq6tA7ng==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr3414040wmj.97.1611052989394; 
 Tue, 19 Jan 2021 02:43:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z63sm4110932wme.8.2021.01.19.02.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:43:08 -0800 (PST)
To: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: git://git.qemu.org/qemu-web.git now pulls from gitlab
Message-ID: <c146373d-5a9e-8093-4f5b-48fd37152702@redhat.com>
Date: Tue, 19 Jan 2021 11:43:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The qemu-web.git repository on git.qemu.org is now a mirror of gitlab. 
The git mirror is updated every 15 minutes.

Pushing new changes to qemu.org therefore must now be done via 
git@gitlab.org:qemu-project/qemu-web.git.  The GitLab qemu-project 
organization is configured so that CI/CD jobs for the master branch will 
automatically update qemu.org.

The next steps are:

- switching qemu.git to also pull from GitLab

- using the same CI/CD configuration (but on qemu.git) to deploy 
https://www.qemu.org/docs/master/

Paolo


