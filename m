Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACA3C7782
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:50:51 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OQc-00027x-4y
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON4-0003wg-SA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:11 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9796)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON3-0002Kl-AL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626205629; x=1657741629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cRnEXpT8ddVZ8CLELYb3bek8bogcWgsdUE1PzhIzO7M=;
 b=FkdieQZfq4LkoAkl1Ih5QGcIkXdYMr3h9AGXVggYEYma7YbvPYv1wpvn
 MCM5LgJGd+3L0nCuL6bcFNvrtCcjkiu7C3zw2VmLzAM/6F+KBbtyS51dC
 LeWP1KachzQ/fTNX+pGV1GENFzKa7DGxEqDUwLuBMkkjcgWxCr9EcTMZZ U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2021 12:47:04 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 13 Jul 2021 12:47:03 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 00207E5F; Tue, 13 Jul 2021 14:47:02 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Hexagon (target/hexagon) do probe_write in
 HELPER(commit_store)
Date: Tue, 13 Jul 2021 14:46:28 -0500
Message-Id: <1626205589-19208-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
References: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hlY2sgdGhhdCBhY2Nlc3MgaXMgT0sgYmVmb3JlIGRvaW5nIHB1dF91c2VyXyoKClNpZ25lZC1v
ZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYyB8IDIzICsrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCmlu
ZGV4IDQ1OTU1NTkuLmQ3ZjUzYTIgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCkBAIC0xNDAsMjIgKzE0MCwyNyBA
QCB2b2lkIEhFTFBFUihkZWJ1Z19jaGVja19zdG9yZV93aWR0aCkoQ1BVSGV4YWdvblN0YXRlICpl
bnYsIGludCBzbG90LCBpbnQgY2hlY2spCiAKIHZvaWQgSEVMUEVSKGNvbW1pdF9zdG9yZSkoQ1BV
SGV4YWdvblN0YXRlICplbnYsIGludCBzbG90X251bSkKIHsKLSAgICBzd2l0Y2ggKGVudi0+bWVt
X2xvZ19zdG9yZXNbc2xvdF9udW1dLndpZHRoKSB7CisgICAgdWludDhfdCB3aWR0aCA9IGVudi0+
bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLndpZHRoOworICAgIHRhcmdldF91bG9uZyB2YSA9IGVu
di0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLnZhOworCisjaWZkZWYgQ09ORklHX1VTRVJfT05M
WQorICAgIGdfYXNzZXJ0KHdpZHRoID09IDEgfHwgd2lkdGggPT0gMiB8fCB3aWR0aCA9PSA0IHx8
IHdpZHRoID09IDgpOworICAgIC8qIFdlIHBlcmZvcm0gdGhpcyBjaGVjayBlbHNld2hlcmUgaW4g
c3lzdGVtIG1vZGUgKi8KKyAgICBwcm9iZV93cml0ZShlbnYsIHZhLCB3aWR0aCwgTU1VX1VTRVJf
SURYLCAwKTsKKyNlbmRpZgorCisgICAgc3dpdGNoICh3aWR0aCkgewogICAgIGNhc2UgMToKLSAg
ICAgICAgcHV0X3VzZXJfdTgoZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90X251bV0uZGF0YTMyLAot
ICAgICAgICAgICAgICAgICAgICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7Cisg
ICAgICAgIHB1dF91c2VyX3U4KGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGEzMiwg
dmEpOwogICAgICAgICBicmVhazsKICAgICBjYXNlIDI6Ci0gICAgICAgIHB1dF91c2VyX3UxNihl
bnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhMzIsCi0gICAgICAgICAgICAgICAgICAg
ICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS52YSk7CisgICAgICAgIHB1dF91c2VyX3Ux
NihlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RfbnVtXS5kYXRhMzIsIHZhKTsKICAgICAgICAgYnJl
YWs7CiAgICAgY2FzZSA0OgotICAgICAgICBwdXRfdXNlcl91MzIoZW52LT5tZW1fbG9nX3N0b3Jl
c1tzbG90X251bV0uZGF0YTMyLAotICAgICAgICAgICAgICAgICAgICAgZW52LT5tZW1fbG9nX3N0
b3Jlc1tzbG90X251bV0udmEpOworICAgICAgICBwdXRfdXNlcl91MzIoZW52LT5tZW1fbG9nX3N0
b3Jlc1tzbG90X251bV0uZGF0YTMyLCB2YSk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgODoK
LSAgICAgICAgcHV0X3VzZXJfdTY0KGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRhdGE2
NCwKLSAgICAgICAgICAgICAgICAgICAgIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLnZh
KTsKKyAgICAgICAgcHV0X3VzZXJfdTY0KGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF9udW1dLmRh
dGE2NCwgdmEpOwogICAgICAgICBicmVhazsKICAgICBkZWZhdWx0OgogICAgICAgICBnX2Fzc2Vy
dF9ub3RfcmVhY2hlZCgpOwotLSAKMi43LjQKCg==

