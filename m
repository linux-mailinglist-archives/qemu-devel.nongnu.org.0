Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474534BD4BD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 05:29:15 +0100 (CET)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM0K2-0000tM-3H
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 23:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.b.czarnota@gmail.com>)
 id 1nLz5G-000251-7T
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 22:09:54 -0500
Received: from [2a00:1450:4864:20::12f] (port=41572
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominik.b.czarnota@gmail.com>)
 id 1nLz5D-0006kQ-5q
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 22:09:53 -0500
Received: by mail-lf1-x12f.google.com with SMTP id f37so16020317lfv.8
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 19:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzYEBKbUsL/D0+9ff6LjQ1qyGdes7js64wXpHKpIMLI=;
 b=VCWjrOA3V6UjHNohxYnVFel8HB4EPNWS7loyFTekI9q9tFoWYR3cJ3YHSkoPvohoWs
 e4llmJoCceNlCVS7YsxwEelhAh/LuqtMd7LNEIoxVpY4CHVD6bamlOCJivgr26vVzpfu
 kz2zvESznCf4J13C5OM4OZLk0z3KPoqX9TiQXbdjkLhWukCEQUD14wWD+aZEuDQvLO0Y
 KQMVT8njFw1ku1j+P+/UADK1AngghqcLdU7wyfX5N9RVvfazNpj2WcyZy3C2a3Rh8bFq
 i/cVqFKZ1GjxjZHQjOS4Yienevd01UPK7dyEUVN9q0Zymj0gChQ4/OKLlWQUNjiadJk9
 fimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lzYEBKbUsL/D0+9ff6LjQ1qyGdes7js64wXpHKpIMLI=;
 b=6rFs0ihJcFjCUbNzvzi7N51pNuAk7mBVQiCTXhelKT3AsZKdFXosrIDPokwd8W5CsB
 2XC0Mbl6lqZrqjHzRuRmotomMR52s+SUOHHbrVLhDW7CHYlz9QV2lBQVY0kJiA5xog2S
 h+s3o+sh/oQoLAccP6i6EMPdatDGq5ovTG/hsKMVNwdlm7oZ2fDt+9nA3RDv3hZPuESh
 EGs4P1n+J5us/T8EyhjdN4mUcNfOEjX6OWeZM5Q/zwGh5aGQUlDv/ohzNqEQui4jXlnp
 XXYooVfhTCcQbb3GYqTCKGOFuk1KCLmhxRaUD+FykqeYgKEmIRJLNSJC0YMVxmoEADd/
 KbVA==
X-Gm-Message-State: AOAM530v0o0h2meJvVhs9YlC/qmAwEuD07g9ItA4Nzeg5gMxq6lzvz5D
 O8dAfBh3jQLNr0+t/RsWq1FSbulalRQnQQ==
X-Google-Smtp-Source: ABdhPJzIlTZS3MgS0ZOw4WiPUmLxvkBzyds6BCZRSFi+ZEtvexXUoY1fzFIralORKKQxXpGWpqi95A==
X-Received: by 2002:ac2:5cd0:0:b0:443:b112:e512 with SMTP id
 f16-20020ac25cd0000000b00443b112e512mr10459886lfq.118.1645412986497; 
 Sun, 20 Feb 2022 19:09:46 -0800 (PST)
Received: from dc.. (77-255-151-236.adsl.inetia.pl. [77.255.151.236])
 by smtp.gmail.com with ESMTPSA id o10sm1102281ljg.92.2022.02.20.19.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 19:09:46 -0800 (PST)
From: Disconnect3d <dominik.b.czarnota@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gdbstub.c: add support for info proc mappings
Date: Mon, 21 Feb 2022 04:09:10 +0100
Message-Id: <20220221030910.3203063-1-dominik.b.czarnota@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=dominik.b.czarnota@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 20 Feb 2022 23:27:30 -0500
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
Cc: alex.bennee@linaro.org, Disconnect3d <dominik.b.czarnota@gmail.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds support for `info proc mappings` and a few other commands into
the QEMU user-mode emulation gdbstub.

For that, support for the following GDB remote protocol commands has been added:
* vFile:setfs: pid
* vFile:open: filename, flags, mode
* vFile:pread: fd, count, offset
* vFile:close: fd
* qXfer:exec-file:read:annex:offset,length

Additionally, a `REMOTE_DEBUG_PRINT` macro has been added for printing remote debug logs.
To enable it, set the `ENABLE_REMOTE_DEBUG` definition to 1.

All this can be tested with the following steps (commands from Ubuntu 20.04):
1. Compiling an example program, e.g. for ARM:
    echo 'int main() {puts("Hello world");}' | arm-linux-gnueabihf-gcc -xc -
2. Running qemu-arm with gdbstub:
    qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./a.out
3. Connecting to the gdbstub with GDB:
    gdb-multiarch -ex 'target remote localhost:1234'
4. Executing `info proc mappings` in GDB.

The opening of files is done on behalf of the inferior by reusing the do_openat syscall.
Note that the current solution is still imperfect: while it allows us to fetch procfs
files like /proc/$pid/maps in the same way as the inferior is seeing them, there are
two downsides to it. First of all, it is indeed performed on behalf of the inferior.
Second of all, there are some files that the GDB tries to request like /lib/libc.so.6,
but they are usually not available as they do not exist in those paths and may need to
be served from the prefix provided in the -L flag to the qemu-user binary. I may try
to add a support for this in another patch and maybe refactor the solution to not use
the do_openat function directly.

Before this commit, one would get (except of amd64, but not i386 targets):
```
(gdb) info proc mappings
process 1
warning: unable to open /proc file '/proc/1/maps'
```

And after this commit, we should get something like:
```
(gdb) info proc mappings
process 3167519
Mapped address spaces:

	Start Addr   End Addr       Size     Offset objfile
	0x3f7d0000 0x3f7d1000     0x1000        0x0
	0x3f7d1000 0x3f7ed000    0x1c000        0x0 /usr/arm-linux-gnueabihf/lib/ld-2.33.so
	0x3f7ed000 0x3f7fd000    0x10000        0x0
	0x3f7fd000 0x3f7ff000     0x2000    0x1c000 /usr/arm-linux-gnueabihf/lib/ld-2.33.so
	0x3f7ff000 0x3f800000     0x1000        0x0
	0x3f800000 0x40000000   0x800000        0x0 [stack]
	0x40000000 0x40001000     0x1000        0x0 /home/dc/src/qemu/a.out
	0x40001000 0x40010000     0xf000        0x0
	0x40010000 0x40012000     0x2000        0x0 /home/dc/src/qemu/a.out
```

However, on amd64 targets we would get and still get the following on the GDB side
(even after this commit):
```
(gdb) info proc mappings
Not supported on this target.
```

The x64 behavior is related to the fact that the GDB client does not initialize
some of its remote handlers properly when the gdbstub does not send an "orig_rax"
register in the target.xml file that describes the target. This happens in GDB in the
amd64_linux_init_abi function in the amd64-linux-tdep.c file [0]. The GDB tries to find
the "org.gnu.gdb.i386.linux" feature and the "orig_rax" register in it and if it is not
present, then it does not proceed with the `amd64_linux_init_abi_common (info, gdbarch, 2);` call
which initializes whatever is needed so that GDB fetches `info proc mappings` properly.

I tried to fix this but just adding the orig_rax registry into the target.xml did not work
(there was some mismatch between the expected and sent register values; I guess the QEMU stub
would need to know how to send this register's value). On the other hand, this could also be
fixed on the GDB side. I will discuss this with GDB maintainers or/and propose a patch to GDB
related to this.

[0] https://github.com/bminor/binutils-gdb/blob/dc5483c989f29fc9c7934965071ae1bb80cff902/gdb/amd64-linux-tdep.c#L1863-L1873

Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
---
 gdbstub.c            | 272 +++++++++++++++++++++++++++++++++++++++++++
 linux-user/qemu.h    |   2 +
 linux-user/syscall.c |   2 +-
 3 files changed, 275 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..69cf8bbb0c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -34,6 +34,10 @@
 #include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
+#ifdef CONFIG_LINUX
+#include "linux-user/qemu.h"
+#include "linux-user/loader.h"
+#endif
 #else
 #include "monitor/monitor.h"
 #include "chardev/char.h"
@@ -62,6 +66,21 @@
 static int phy_memory_mode;
 #endif
 
+/*
+ *  Set to 1 to enable remote protocol debugging output. This output is similar
+ *  to the one produced by the gdbserver's --remote-debug flag with some
+ *  additions. Anyway, the main debug prints are:
+ * - getpkt ("...") which refers to received data (or, send by the GDB client)
+ * - putpkt ("...") which refers to sent data
+ */
+#define ENABLE_REMOTE_DEBUG 0
+
+#if ENABLE_REMOTE_DEBUG
+#define REMOTE_DEBUG_PRINT printf
+#else
+#define REMOTE_DEBUG_PRINT(...)
+#endif
+
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
                                          uint8_t *buf, int len, bool is_write)
 {
@@ -554,6 +573,7 @@ static int gdb_continue_partial(char *newstates)
 
 static void put_buffer(const uint8_t *buf, int len)
 {
+    REMOTE_DEBUG_PRINT("putpkt (\"%.*s\");\n", len, buf);
 #ifdef CONFIG_USER_ONLY
     int ret;
 
@@ -1982,6 +2002,157 @@ static void handle_v_kill(GArray *params, void *user_ctx)
     exit(0);
 }
 
+#ifdef CONFIG_USER_ONLY
+/*
+ * Handles the `vFile:setfs: pid` command
+ *
+ * Example call: vFile:setfs:0
+ *
+ * --- From the GDB remote protocol documentation ---
+ * Select the filesystem on which vFile operations with filename arguments
+ * will operate. This is required for GDB to be able to access files on
+ * remote targets where the remote stub does not share a common filesystem with
+ * the inferior(s). If pid is nonzero, select the filesystem as seen by process
+ * pid. If pid is zero, select the filesystem as seen by the remote stub.
+ * Return 0 on success, or -1 if an error occurs. If vFile:setfs: indicates
+ * success, the selected filesystem remains selected until the next successful
+ * vFile:setfs: operation.
+*/
+static void handle_v_setfs(GArray *params, void *user_ctx)
+{
+    /*
+     * We do not support different filesystem view for different pids
+     * Return that all is OK, so that GDB can proceed
+     */
+    put_packet("F0");
+}
+
+/*
+ * Handle the `vFile:open: filename, flags, mode` command
+ *
+ * We try to serve the filesystem here from the inferior point of view
+
+ * Example call: vFile:open:6a7573742070726f62696e67,0,1c0
+ * (tries to open "just probing" with flags=0 mode=448)
+ *
+ * --- From the GDB remote protocol documentation ---
+ * Open a file at filename and return a file descriptor for it, or return
+ * -1 if an error occurs. The filename is a string, flags is an integer
+ * indicating a mask of open flags (see Open Flags), and mode is an integer
+ * indicating a mask of mode bits to use if the file is created
+ * (see mode_t Values). See open, for details of the open flags and mode
+ * values.
+ */
+static void handle_v_file_open(GArray *params, void *user_ctx)
+{
+    uint64_t flags = get_param(params, 1)->val_ull;
+    uint64_t mode = get_param(params, 2)->val_ull;
+    const char *hex_filename = get_param(params, 0)->data;
+
+    /* Decode the filename & append a null byte so we can use it later on */
+    hextomem(gdbserver_state.mem_buf, hex_filename, strlen(hex_filename));
+    const char *null_byte = "\0";
+    g_byte_array_append(gdbserver_state.mem_buf, (const guint8 *)null_byte, 1);
+
+    const char *filename = (const char *)gdbserver_state.mem_buf->data;
+
+    REMOTE_DEBUG_PRINT("vFile:open: filename=\"%s\" flags=%ld mode=%ld\n",
+                       filename, flags, mode);
+
+    /*
+     * On Linux we call the do_openat syscall on behalf of the inferior as it
+     * handles special filepaths properly like the /proc/$pid files, which are
+     * fetched by GDB for certain info (such as `info proc mappings`).
+     */
+#ifdef CONFIG_LINUX
+    int fd = do_openat(gdbserver_state.g_cpu->env_ptr,
+                       /* dirfd */ 0, filename, flags, mode);
+    REMOTE_DEBUG_PRINT("do_openat = %d\n", fd);
+#else
+    int fd = open(filename, flags, mode);
+    REMOTE_DEBUG_PRINT("open = %d\n", fd);
+#endif
+
+    g_string_printf(gdbserver_state.str_buf, "F%d", fd);
+    if (fd < 0) {
+        /* Append ENOENT result.
+         * TODO/FIXME: Can we retrieve errno from do_openat/open and return it here?
+         */
+        g_string_append(gdbserver_state.str_buf, ",2");
+    }
+    put_strbuf();
+}
+
+/*
+ * Handles the `vFile:pread: fd, count, offset` command
+ *
+ * Example call: vFile:pread:7,47ff,0
+ *
+ * --- From the GDB remote protocol documentation ---
+ * Read data from the open file corresponding to fd.
+ * Up to count bytes will be read from the file, starting at offset relative to
+ * the start of the file. The target may read fewer bytes; common reasons
+ * include packet size limits and an end-of-file condition. The number of bytes
+ * read is returned. Zero should only be returned for a successful read at the
+ * end of the file, or if count was zero.
+ *
+ * The data read should be returned as a binary attachment on success. If zero
+ * bytes were read, the response should include an empty binary attachment
+ * (i.e. a trailing semicolon). The return value is the number of target bytes
+ * read; the binary attachment may be longer if some characters were escaped.
+ */
+static void handle_v_file_pread(GArray *params, void *user_ctx)
+{
+    int fd = get_param(params, 0)->val_ul;
+    uint64_t count = get_param(params, 1)->val_ull;
+    uint64_t offset = get_param(params, 2)->val_ull;
+
+    g_autoptr(GString) file_content = g_string_new(NULL);
+
+    REMOTE_DEBUG_PRINT("vFile:read: fd=%d, count=%lu, offset=%lu\n",
+                       fd, count, offset);
+
+    while (count > 0) {
+        char buf[1024] = {0};
+        ssize_t n = pread(fd, buf, sizeof(buf), offset);
+        if (n <= 0) {
+            break;
+        }
+        g_string_append_len(file_content, buf, n);
+        count -= n;
+        offset += n;
+    }
+    g_string_printf(gdbserver_state.str_buf, "F%lx;", file_content->len);
+    /* Encode special chars */
+    memtox(gdbserver_state.str_buf, file_content->str, file_content->len);
+    put_packet_binary(gdbserver_state.str_buf->str,
+                      gdbserver_state.str_buf->len, true);
+}
+
+/*
+ * Handles the `vFile:close: fd` command
+ *
+ * Example call: vFile:close:7
+ *
+ * --- From the GDB remote protocol documentation ---
+ * Close the open file corresponding to fd and return 0, or -1 if an error occurs.
+ */
+static void handle_v_file_close(GArray *params, void *user_ctx)
+{
+    int fd = get_param(params, 0)->val_ul;
+    int res = close(fd);
+    if (res == 0) {
+        put_packet("F00");
+    } else {
+        /* This may happen only with a bugged GDB client or a bugged inferior */
+        REMOTE_DEBUG_PRINT("Warning: the vFile:close(fd=%d) operation returned %d\n",
+                           fd, res);
+        g_string_printf(gdbserver_state.str_buf, "F%d,%d", res, errno);
+        put_strbuf();
+    }
+}
+#endif /* CONFIG_USER_ONLY */
+
 static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
@@ -2001,6 +2172,32 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
         .cmd_startswith = 1,
         .schema = "l0"
     },
+    #ifdef CONFIG_USER_ONLY
+    {
+        .handler = handle_v_setfs,
+        .cmd = "File:setfs:",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
+    {
+        .handler = handle_v_file_open,
+        .cmd = "File:open:",
+        .cmd_startswith = 1,
+        .schema = "s,L,L0"
+    },
+    {
+        .handler = handle_v_file_pread,
+        .cmd = "File:pread:",
+        .cmd_startswith = 1,
+        .schema = "l,L,L0"
+    },
+    {
+        .handler = handle_v_file_close,
+        .cmd = "File:close:",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
+    #endif
     {
         .handler = handle_v_kill,
         .cmd = "Kill;",
@@ -2197,6 +2394,8 @@ static void handle_query_supported(GArray *params, void *user_ctx)
     if (gdbserver_state.c_cpu->opaque) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
+
+    g_string_append(gdbserver_state.str_buf, ";qXfer:exec-file:read+");
 #endif
 
     if (params->len &&
@@ -2305,6 +2504,63 @@ static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
     put_packet_binary(gdbserver_state.str_buf->str,
                       gdbserver_state.str_buf->len, true);
 }
+
+/*
+ * Handle the `qXfer:exec-file:read:annex:offset,length` command
+ *
+ * Example call: qXfer:exec-file:read:241022:0,ffb
+ *
+ * --- From the GDB remote protocol documentation ---
+ * Return the full absolute name of the file that was executed to create a process
+ * running on the remote system. The annex specifies the numeric process ID of the
+ * process to query, encoded as a hexadecimal number. If the annex part is empty the
+ * remote stub should return the filename corresponding to the currently executing
+ * process.
+ *
+ * This packet is not probed by default; the remote stub must request it, by supplying
+ * an appropriate ‘qSupported’ response (see qSupported).
+ */
+static void handle_query_xfer_exec_file(GArray *params, void *user_ctx)
+{
+    uint32_t pid = get_param(params, 0)->val_ul;
+    uint32_t offset = get_param(params, 1)->val_ul;
+    uint32_t length = get_param(params, 2)->val_ul;
+
+    GDBProcess *process = gdb_get_process(pid);
+    if (!process) {
+        put_packet("E01");
+        return;
+    }
+
+    CPUState *cpu = get_first_cpu_in_process(process);
+    if (!cpu) {
+        put_packet("E02");
+        return;
+    }
+
+    TaskState *ts = cpu->opaque;
+    /* Those should be there but lets sanity check them */
+    if (!ts || !ts->bprm || !ts->bprm->filename) {
+        put_packet("E03");
+        return;
+    }
+
+    /*
+     * This filename is an absolute path even when QEMU user-mode emulation is called
+     * with a symlink path so we do not have to resolve it with readlink(2)
+     */
+    const char *filename = ts->bprm->filename;
+
+    /* It does not make sense to return anything after the filename */
+    if (offset > strlen(filename)) {
+        put_packet("E04");
+        return;
+    }
+
+    g_string_printf(gdbserver_state.str_buf, "l%.*s", length, filename + offset);
+    put_strbuf();
+    return;
+}
 #endif
 
 static void handle_query_attached(GArray *params, void *user_ctx)
@@ -2419,6 +2675,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "l,l0"
     },
+    {
+        .handler = handle_query_xfer_exec_file,
+        .cmd = "Xfer:exec-file:read:",
+        .cmd_startswith = 1,
+        .schema = "l:l,l0"
+    },
 #endif
     {
         .handler = handle_query_attached,
@@ -2516,6 +2778,7 @@ static int gdb_handle_packet(const char *line_buf)
     const GdbCmdParseEntry *cmd_parser = NULL;
 
     trace_gdbstub_io_command(line_buf);
+    REMOTE_DEBUG_PRINT("getpkt (\"%s\");\n", line_buf);
 
     switch (line_buf[0]) {
     case '!':
@@ -3133,6 +3396,15 @@ static void create_default_process(GDBState *s)
     GDBProcess *process;
     int max_pid = 0;
 
+#if defined(CONFIG_USER_ONLY)
+    /*
+     * In QEMU user-mode emulation we want to return the real PID of the proces
+     * as this allows us to return proper view of /proc/$pid files as seen by
+     * the inferior
+     */
+    max_pid = getpid() - 1;
+#endif
+
     if (gdbserver_state.process_num) {
         max_pid = s->processes[s->process_num - 1].pid;
     }
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 98dfbf2096..44a71b9740 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -182,6 +182,8 @@ static inline bool access_ok(CPUState *cpu, int type,
     return access_ok_untagged(type, cpu_untagged_addr(cpu, addr), size);
 }
 
+int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode);
+
 /* NOTE __get_user and __put_user use host pointers and don't check access.
    These are usually used to access struct data members once the struct has
    been locked - usually with lock_user_struct.  */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b9b18a7eaf..bfc271b568 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8233,7 +8233,7 @@ static int open_hardware(void *cpu_env, int fd)
 }
 #endif
 
-static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
+int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
 {
     struct fake_open {
         const char *filename;
-- 
2.30.2


