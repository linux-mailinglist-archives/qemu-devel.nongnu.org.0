Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12640AD58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:17:49 +0200 (CEST)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Nk-0003mj-Sl
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mQ7Kf-000187-N8
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:14:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mQ7Kd-0006AY-0K
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:14:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so1925167wmc.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZsB60mXyyyTe4spuUfhXfdhho/3kl6i0ItffudINbY=;
 b=b61FG/8HjC7fc5jiPthCN65Kb599Qm1+K9wYHH9ASswYVhJObLfHMavTuLvOga324o
 P+15/CXEUQ99tSGirZZA3DZYtsJX9sA+N6Sl3XKFg9nQvUTMQ0GrISmv9f8v7eMKA3N9
 XFF4UvZxhVBMy9Pg0gO0h7sZh/hNXz2wOmFmrEFMs3JSelJHsa3E/rq+QmMGodpYudZ2
 a3FC45RhmzAtq22EjbW+L9BQfhincAON8XBAFucNh6fbHgJ46Z35JT/ePoo7zNPcoNWK
 VqRKqcPJdebsj3R3vwt0CdhdFjAlk7E+SYwPZ+rlGZ3je2VXEZvGPudL2kkXzuCl8rTC
 ML/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZsB60mXyyyTe4spuUfhXfdhho/3kl6i0ItffudINbY=;
 b=FCCMXdTnlCannOJMOG5MBZZ4qQJjd3xcun9SH2/kEadCTAMlLe63Wp3ucDIAHDmWgv
 tV5rd2Rz4LOz3UTHDDaRi60skwj77L+YPuIRUHtE5J7jw6Jp93EA0Cwq2UZ/djOYdPug
 udLu6N7Rnwy+x13YWCd8xQKP758bJWSoHMjKV0gj5kDs6dWdIz2MY6QDZ2OaOYPxldyV
 xbB8lQwsS0/oqalaBt+BRMvyqN4Iez3/0YC2qtWlHELmfEfdC8SmMDkmFvRqrhR64H7E
 8PMLJMRhZw9RiqxDPio0IRLmu1jK6NKxS+YYgc4Mrwj1HnK58iJwkGvmXB18A6us39OR
 4BnQ==
X-Gm-Message-State: AOAM5322GN795IG1bAbSxqFRF5FoZfLnZjVk/dZBGKOWLZirkAIOfKSV
 XcnvyYgTP2ur/mL1LpAY+I3GA6UstU3iAneq
X-Google-Smtp-Source: ABdhPJwUFbEy1hVwLJCp4OsYvUrlgoPZTAhXYmwffk6WHEh+tMDd8DmNlcOWRG3HZFav0/+IAVEhwA==
X-Received: by 2002:a1c:2057:: with SMTP id g84mr1867140wmg.140.1631621672377; 
 Tue, 14 Sep 2021 05:14:32 -0700 (PDT)
Received: from localhost.localdomain ([185.213.234.105])
 by smtp.gmail.com with ESMTPSA id m2sm998792wmm.3.2021.09.14.05.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:14:32 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qga-win: Detect Windows 11 by build number
Date: Tue, 14 Sep 2021 15:14:20 +0300
Message-Id: <20210914121420.183499-2-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914121420.183499-1-konstantin@daynix.com>
References: <20210914121420.183499-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=konstantin@daynix.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows 10 and 11 have the same major and minor versions.
So, the only way to determine the correct version is to
use the build number.

After this commit, the guest agent will return the proper
"version" and "version-id" for Windows 11. The "pretty-name"
is read from the registry and will be incorrect until the
MS updates the registry. We only can create some workaround
and replace 10 to 11.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a8e9d40b31..f9ac1c31f5 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2137,7 +2137,7 @@ typedef struct _ga_matrix_lookup_t {
     char const *version_id;
 } ga_matrix_lookup_t;
 
-static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][8] = {
+static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][7] = {
     {
         /* Desktop editions */
         { 5, 0, "Microsoft Windows 2000",   "2000"},
@@ -2146,7 +2146,6 @@ static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][8] = {
         { 6, 1, "Microsoft Windows 7"       "7"},
         { 6, 2, "Microsoft Windows 8",      "8"},
         { 6, 3, "Microsoft Windows 8.1",    "8.1"},
-        {10, 0, "Microsoft Windows 10",     "10"},
         { 0, 0, 0}
     },{
         /* Server editions */
@@ -2156,24 +2155,29 @@ static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2][8] = {
         { 6, 2, "Microsoft Windows Server 2012",        "2012"},
         { 6, 3, "Microsoft Windows Server 2012 R2",     "2012r2"},
         { 0, 0, 0},
-        { 0, 0, 0},
         { 0, 0, 0}
     }
 };
 
-typedef struct _ga_win_10_0_server_t {
+typedef struct _ga_win_10_0_t {
     int first_build;
     char const *version;
     char const *version_id;
-} ga_win_10_0_server_t;
+} ga_win_10_0_t;
 
-static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
+static ga_win_10_0_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
     {14393, "Microsoft Windows Server 2016",    "2016"},
     {17763, "Microsoft Windows Server 2019",    "2019"},
     {20344, "Microsoft Windows Server 2022",    "2022"},
     {0, 0}
 };
 
+static ga_win_10_0_t const WIN_10_0_CLIENT_VERSION_MATRIX[3] = {
+    {10240, "Microsoft Windows 10",    "10"},
+    {22000, "Microsoft Windows 11",    "11"},
+    {0, 0}
+};
+
 static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
 {
     typedef NTSTATUS(WINAPI *rtl_get_version_t)(
@@ -2201,10 +2205,11 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
     DWORD build = os_version->dwBuildNumber;
     int tbl_idx = (os_version->wProductType != VER_NT_WORKSTATION);
     ga_matrix_lookup_t const *table = WIN_VERSION_MATRIX[tbl_idx];
-    ga_win_10_0_server_t const *win_10_0_table = WIN_10_0_SERVER_VERSION_MATRIX;
-    ga_win_10_0_server_t const *win_10_0_version = NULL;
+    ga_win_10_0_t const *win_10_0_table = tbl_idx ?
+        WIN_10_0_SERVER_VERSION_MATRIX : WIN_10_0_CLIENT_VERSION_MATRIX;
+    ga_win_10_0_t const *win_10_0_version = NULL;
     while (table->version != NULL) {
-        if (major == 10 && minor == 0 && tbl_idx) {
+        if (major == 10 && minor == 0) {
             while (win_10_0_table->version != NULL) {
                 if (build >= win_10_0_table->first_build) {
                     win_10_0_version = win_10_0_table;
-- 
2.33.0


